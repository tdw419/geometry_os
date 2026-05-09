; DESCRIPTION: Composite: Renders a cyan disk with center (309, 64) and radius 26 then Draws a green line from (419, 113) to (15, 2).
; PLAN: r0=309(x), r1=64(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=419(x1), r6=113(y1), r7=15(x2), r8=2(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 309
LDI r1, 64
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 419
LDI r6, 113
LDI r7, 15
LDI r8, 2
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
