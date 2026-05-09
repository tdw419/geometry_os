; DESCRIPTION: Composite: Places a magenta circle of radius 27 at center (159, 145) then Renders a cyan line between points (30, 202) and (317, 230) then Sets a single white pixel at (362, 123).
; PLAN: r0=159(x), r1=145(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=30(x1), r6=202(y1), r7=317(x2), r8=230(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=362(x), r11=123(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 159
LDI r1, 145
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 30
LDI r6, 202
LDI r7, 317
LDI r8, 230
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 362
LDI r11, 123
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
