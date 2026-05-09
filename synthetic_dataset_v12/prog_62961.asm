; DESCRIPTION: Composite: Renders a cyan disk with center (128, 81) and radius 24 then Places a purple dot at position (69, 199) then Draws a yellow line from (492, 226) to (213, 148).
; PLAN: r0=128(x), r1=81(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=69(x), r6=199(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=492(x1), r11=226(y1), r12=213(x2), r13=148(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 128
LDI r1, 81
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 69
LDI r6, 199
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 492
LDI r11, 226
LDI r12, 213
LDI r13, 148
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
