; DESCRIPTION: Composite: Renders a white line between points (221, 24) and (247, 243) then Renders a blue disk with center (140, 238) and radius 11 then Places a cyan dot at position (395, 23).
; PLAN: r0=221(x1), r1=24(y1), r2=247(x2), r3=243(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=140(x), r6=238(y), r7=11(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=395(x), r11=23(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 221
LDI r1, 24
LDI r2, 247
LDI r3, 243
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 140
LDI r6, 238
LDI r7, 11
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 395
LDI r11, 23
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
