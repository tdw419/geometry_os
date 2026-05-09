; DESCRIPTION: Composite: Places a black dot at position (507, 28) then Renders a yellow disk with center (397, 140) and radius 49 then Draws a purple line from (502, 67) to (31, 29).
; PLAN: r0=507(x), r1=28(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=397(x), r6=140(y), r7=49(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=502(x1), r11=67(y1), r12=31(x2), r13=29(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 507
LDI r1, 28
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 397
LDI r6, 140
LDI r7, 49
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 502
LDI r11, 67
LDI r12, 31
LDI r13, 29
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
