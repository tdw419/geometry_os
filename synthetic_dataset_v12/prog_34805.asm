; DESCRIPTION: Composite: Renders a red line between points (94, 215) and (185, 168) then Sets a single magenta pixel at (10, 161) then Renders a cyan disk with center (53, 103) and radius 41.
; PLAN: r0=94(x1), r1=215(y1), r2=185(x2), r3=168(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=10(x), r6=161(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=53(x), r11=103(y), r12=41(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 94
LDI r1, 215
LDI r2, 185
LDI r3, 168
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 10
LDI r6, 161
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 53
LDI r11, 103
LDI r12, 41
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
