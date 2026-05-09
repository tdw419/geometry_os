; DESCRIPTION: Renders a orange box of size 94x70 starting at (378, 140).
; PLAN: r0=378(x), r1=140(y), r2=94(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 140
LDI r2, 94
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
