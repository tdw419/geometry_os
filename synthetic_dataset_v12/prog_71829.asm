; DESCRIPTION: Composite: Renders a yellow disk with center (337, 93) and radius 39 then Renders a blue line between points (63, 236) and (215, 226) then Places a white dot at position (489, 183).
; PLAN: r0=337(x), r1=93(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=63(x1), r6=236(y1), r7=215(x2), r8=226(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=489(x), r11=183(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 337
LDI r1, 93
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 63
LDI r6, 236
LDI r7, 215
LDI r8, 226
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 489
LDI r11, 183
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
