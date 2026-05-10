; DESCRIPTION: Composite: Places a magenta circle of radius 53 at center (211, 71) then Draws a red line from (224, 34) to (240, 205).
; PLAN: r0=211(x), r1=71(y), r2=53(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=224(x1), r6=34(y1), r7=240(x2), r8=205(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 211
LDI r1, 71
LDI r2, 53
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 224
LDI r6, 34
LDI r7, 240
LDI r8, 205
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
