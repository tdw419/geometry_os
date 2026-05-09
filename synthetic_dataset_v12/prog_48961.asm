; DESCRIPTION: Composite: Creates a green rectangular region at (22, 127) spanning 86 by 113 pixels then Renders a blue disk with center (42, 202) and radius 11 then Places a green dot at position (191, 70).
; PLAN: r0=22(x), r1=127(y), r2=86(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=42(x), r6=202(y), r7=11(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=191(x), r11=70(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 22
LDI r1, 127
LDI r2, 86
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 42
LDI r6, 202
LDI r7, 11
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 191
LDI r11, 70
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
