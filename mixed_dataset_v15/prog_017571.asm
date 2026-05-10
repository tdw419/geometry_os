; DESCRIPTION: Composite: Renders a magenta line between points (161, 84) and (174, 164) then Renders a cyan disk with center (291, 96) and radius 58.
; PLAN: r0=161(x1), r1=84(y1), r2=174(x2), r3=164(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=291(x), r6=96(y), r7=58(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 161
LDI r1, 84
LDI r2, 174
LDI r3, 164
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 96
LDI r7, 58
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
