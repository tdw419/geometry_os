; DESCRIPTION: Composite: Places a blue 28x93 rectangle at position (108, 98) then Places a purple dot at position (114, 24) then Renders a orange line between points (145, 140) and (65, 132).
; PLAN: r0=108(x), r1=98(y), r2=28(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=114(x), r6=24(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=145(x1), r11=140(y1), r12=65(x2), r13=132(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 108
LDI r1, 98
LDI r2, 28
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 114
LDI r6, 24
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 145
LDI r11, 140
LDI r12, 65
LDI r13, 132
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
