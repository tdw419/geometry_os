; DESCRIPTION: Composite: Renders a blue disk with center (397, 128) and radius 51 then Places a green 102x81 rectangle at position (34, 74) then Renders a magenta line between points (339, 193) and (391, 148).
; PLAN: r0=397(x), r1=128(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=34(x), r6=74(y), r7=102(width), r8=81(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=339(x1), r11=193(y1), r12=391(x2), r13=148(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 397
LDI r1, 128
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 34
LDI r6, 74
LDI r7, 102
LDI r8, 81
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 339
LDI r11, 193
LDI r12, 391
LDI r13, 148
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
