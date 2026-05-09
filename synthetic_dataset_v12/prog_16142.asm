; DESCRIPTION: Composite: Places a magenta circle of radius 39 at center (261, 193) then Renders a green line between points (438, 31) and (188, 187).
; PLAN: r0=261(x), r1=193(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=438(x1), r6=31(y1), r7=188(x2), r8=187(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 261
LDI r1, 193
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 438
LDI r6, 31
LDI r7, 188
LDI r8, 187
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
