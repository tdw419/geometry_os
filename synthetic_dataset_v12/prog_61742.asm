; DESCRIPTION: Composite: Draws a magenta line from (371, 139) to (191, 189) then Renders a cyan disk with center (459, 167) and radius 41.
; PLAN: r0=371(x1), r1=139(y1), r2=191(x2), r3=189(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=459(x), r6=167(y), r7=41(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 371
LDI r1, 139
LDI r2, 191
LDI r3, 189
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 459
LDI r6, 167
LDI r7, 41
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
