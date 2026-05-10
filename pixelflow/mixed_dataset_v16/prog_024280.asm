; DESCRIPTION: Composite: Renders a cyan line between points (246, 234) and (164, 135) then Renders a orange disk with center (257, 148) and radius 63.
; PLAN: r0=246(x1), r1=234(y1), r2=164(x2), r3=135(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=257(x), r6=148(y), r7=63(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 246
LDI r1, 234
LDI r2, 164
LDI r3, 135
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 148
LDI r7, 63
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
