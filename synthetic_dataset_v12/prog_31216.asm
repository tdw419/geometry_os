; DESCRIPTION: Composite: Renders a blue disk with center (284, 161) and radius 38 then Places a red dot at position (466, 6) then Places a blue line segment connecting (411, 157) to (167, 180).
; PLAN: r0=284(x), r1=161(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=466(x), r6=6(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=411(x1), r11=157(y1), r12=167(x2), r13=180(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 284
LDI r1, 161
LDI r2, 38
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 466
LDI r6, 6
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 411
LDI r11, 157
LDI r12, 167
LDI r13, 180
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
