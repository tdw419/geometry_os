; DESCRIPTION: Composite: Renders a cyan disk with center (344, 178) and radius 59 then Places a yellow line segment connecting (333, 236) to (223, 155).
; PLAN: r0=344(x), r1=178(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=333(x1), r6=236(y1), r7=223(x2), r8=155(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 344
LDI r1, 178
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 333
LDI r6, 236
LDI r7, 223
LDI r8, 155
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
