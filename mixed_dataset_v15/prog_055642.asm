; DESCRIPTION: Composite: Renders a blue disk with center (236, 171) and radius 41 then Places a cyan line segment connecting (463, 6) to (239, 197).
; PLAN: r0=236(x), r1=171(y), r2=41(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=463(x1), r6=6(y1), r7=239(x2), r8=197(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 236
LDI r1, 171
LDI r2, 41
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 463
LDI r6, 6
LDI r7, 239
LDI r8, 197
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
