; DESCRIPTION: Composite: Places a orange circle of radius 34 at center (362, 196) then Places a purple line segment connecting (115, 157) to (10, 165) then Places a cyan dot at position (215, 148).
; PLAN: r0=362(x), r1=196(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=115(x1), r6=157(y1), r7=10(x2), r8=165(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=215(x), r11=148(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 362
LDI r1, 196
LDI r2, 34
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 115
LDI r6, 157
LDI r7, 10
LDI r8, 165
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 215
LDI r11, 148
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
