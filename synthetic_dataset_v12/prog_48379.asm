; DESCRIPTION: Composite: Renders a orange disk with center (307, 160) and radius 65 then Draws a yellow line from (424, 3) to (281, 93).
; PLAN: r0=307(x), r1=160(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=424(x1), r6=3(y1), r7=281(x2), r8=93(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 307
LDI r1, 160
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 424
LDI r6, 3
LDI r7, 281
LDI r8, 93
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
