; DESCRIPTION: Composite: Places a black circle of radius 74 at center (347, 180) then Renders a blue box of size 105x69 starting at (406, 117).
; PLAN: r0=347(x), r1=180(y), r2=74(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=406(x), r6=117(y), r7=105(width), r8=69(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 347
LDI r1, 180
LDI r2, 74
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 406
LDI r6, 117
LDI r7, 105
LDI r8, 69
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
