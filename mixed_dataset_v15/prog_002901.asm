; DESCRIPTION: Composite: Creates a green rectangular region at (113, 78) spanning 64 by 88 pixels then Sets a single blue pixel at (455, 127) then Renders a cyan line between points (391, 243) and (503, 158).
; PLAN: r0=113(x), r1=78(y), r2=64(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=455(x), r6=127(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=391(x1), r11=243(y1), r12=503(x2), r13=158(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 113
LDI r1, 78
LDI r2, 64
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 455
LDI r6, 127
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 391
LDI r11, 243
LDI r12, 503
LDI r13, 158
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
