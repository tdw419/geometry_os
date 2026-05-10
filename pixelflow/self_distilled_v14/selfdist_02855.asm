; DESCRIPTION: Places a orange 26x44 box at position (79, 55).
; PLAN: r0=79(x), r1=55(y), r2=26(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 55
LDI r2, 26
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
