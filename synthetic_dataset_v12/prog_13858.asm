; DESCRIPTION: Composite: Draws a blue line from (398, 107) to (73, 43) then Renders a orange disk with center (258, 111) and radius 72 then Sets a single magenta pixel at (382, 57).
; PLAN: r0=398(x1), r1=107(y1), r2=73(x2), r3=43(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=258(x), r6=111(y), r7=72(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=382(x), r11=57(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 398
LDI r1, 107
LDI r2, 73
LDI r3, 43
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 111
LDI r7, 72
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 382
LDI r11, 57
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
