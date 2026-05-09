; DESCRIPTION: Composite: Renders a yellow disk with center (218, 123) and radius 24 then Places a blue dot at position (126, 81) then Draws a purple line from (114, 47) to (167, 46).
; PLAN: r0=218(x), r1=123(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=126(x), r6=81(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=114(x1), r11=47(y1), r12=167(x2), r13=46(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 218
LDI r1, 123
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 126
LDI r6, 81
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 114
LDI r11, 47
LDI r12, 167
LDI r13, 46
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
