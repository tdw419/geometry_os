; DESCRIPTION: Composite: Draws a cyan line from (308, 157) to (283, 190) then Renders a magenta disk with center (33, 126) and radius 22.
; PLAN: r0=308(x1), r1=157(y1), r2=283(x2), r3=190(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=33(x), r6=126(y), r7=22(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 308
LDI r1, 157
LDI r2, 283
LDI r3, 190
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 33
LDI r6, 126
LDI r7, 22
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
