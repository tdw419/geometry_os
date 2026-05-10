; DESCRIPTION: Composite: Draws a orange line from (26, 120) to (326, 72) then Renders a black disk with center (239, 93) and radius 67.
; PLAN: r0=26(x1), r1=120(y1), r2=326(x2), r3=72(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=239(x), r6=93(y), r7=67(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 26
LDI r1, 120
LDI r2, 326
LDI r3, 72
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 239
LDI r6, 93
LDI r7, 67
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
