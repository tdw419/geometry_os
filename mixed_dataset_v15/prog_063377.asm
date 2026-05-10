; DESCRIPTION: Places a orange 113x10 rectangle at position (26, 164).
; PLAN: r0=26(x), r1=164(y), r2=113(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 164
LDI r2, 113
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
