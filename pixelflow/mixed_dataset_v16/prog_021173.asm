; DESCRIPTION: Composite: Renders a black line between points (475, 140) and (349, 120) then Places a magenta dot at position (175, 243) then Renders a cyan disk with center (412, 81) and radius 73.
; PLAN: r0=475(x1), r1=140(y1), r2=349(x2), r3=120(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=175(x), r6=243(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=412(x), r11=81(y), r12=73(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 475
LDI r1, 140
LDI r2, 349
LDI r3, 120
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 243
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 412
LDI r11, 81
LDI r12, 73
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
