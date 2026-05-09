; DESCRIPTION: Composite: Draws a cyan line from (190, 15) to (468, 135) then Renders a cyan disk with center (296, 62) and radius 36.
; PLAN: r0=190(x1), r1=15(y1), r2=468(x2), r3=135(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=296(x), r6=62(y), r7=36(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 190
LDI r1, 15
LDI r2, 468
LDI r3, 135
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 296
LDI r6, 62
LDI r7, 36
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
