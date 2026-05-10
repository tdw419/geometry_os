; DESCRIPTION: Places a orange 103x55 box at position (281, 106).
; PLAN: r0=281(x), r1=106(y), r2=103(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 106
LDI r2, 103
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
