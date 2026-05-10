; DESCRIPTION: Places a orange 15x17 box at position (378, 90).
; PLAN: r0=378(x), r1=90(y), r2=15(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 90
LDI r2, 15
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
