; DESCRIPTION: Composite: Places a orange line segment connecting (121, 19) to (123, 143) then Places a cyan dot at position (242, 128) then Renders a purple disk with center (121, 202) and radius 41.
; PLAN: r0=121(x1), r1=19(y1), r2=123(x2), r3=143(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=242(x), r6=128(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=121(x), r11=202(y), r12=41(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 121
LDI r1, 19
LDI r2, 123
LDI r3, 143
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 242
LDI r6, 128
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 121
LDI r11, 202
LDI r12, 41
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
