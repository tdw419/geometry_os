; DESCRIPTION: Composite: Renders a cyan line between points (251, 39) and (420, 160) then Sets a single white pixel at (394, 245) then Renders a blue disk with center (103, 133) and radius 11.
; PLAN: r0=251(x1), r1=39(y1), r2=420(x2), r3=160(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=394(x), r6=245(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=103(x), r11=133(y), r12=11(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 251
LDI r1, 39
LDI r2, 420
LDI r3, 160
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 394
LDI r6, 245
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 103
LDI r11, 133
LDI r12, 11
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
