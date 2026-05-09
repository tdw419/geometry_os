; DESCRIPTION: Composite: Renders a black line between points (33, 215) and (288, 127) then Sets a single orange pixel at (214, 158).
; PLAN: r0=33(x1), r1=215(y1), r2=288(x2), r3=127(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=214(x), r6=158(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 33
LDI r1, 215
LDI r2, 288
LDI r3, 127
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 158
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
