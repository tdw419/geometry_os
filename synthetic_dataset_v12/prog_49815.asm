; DESCRIPTION: Places a orange 22x75 rectangle at position (378, 9).
; PLAN: r0=378(x), r1=9(y), r2=22(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 9
LDI r2, 22
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
