; DESCRIPTION: Composite: Places a purple circle of radius 34 at center (292, 97) then Places a green line segment connecting (446, 113) to (276, 6).
; PLAN: r0=292(x), r1=97(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=446(x1), r6=113(y1), r7=276(x2), r8=6(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 292
LDI r1, 97
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 446
LDI r6, 113
LDI r7, 276
LDI r8, 6
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
