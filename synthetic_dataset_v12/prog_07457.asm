; DESCRIPTION: Composite: Creates a white rectangular region at (202, 74) spanning 65 by 22 pixels then Renders a blue disk with center (336, 131) and radius 73 then Places a green dot at position (50, 87).
; PLAN: r0=202(x), r1=74(y), r2=65(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=336(x), r6=131(y), r7=73(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=50(x), r11=87(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 202
LDI r1, 74
LDI r2, 65
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 131
LDI r7, 73
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 50
LDI r11, 87
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
