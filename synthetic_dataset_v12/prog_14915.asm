; DESCRIPTION: Composite: Creates a blue rectangular region at (402, 107) spanning 42 by 17 pixels then Places a green dot at position (310, 53) then Renders a black line between points (5, 243) and (345, 59).
; PLAN: r0=402(x), r1=107(y), r2=42(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=310(x), r6=53(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=5(x1), r11=243(y1), r12=345(x2), r13=59(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 402
LDI r1, 107
LDI r2, 42
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 310
LDI r6, 53
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 5
LDI r11, 243
LDI r12, 345
LDI r13, 59
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
