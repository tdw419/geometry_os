; DESCRIPTION: Composite: Renders a white line between points (171, 130) and (356, 240) then Renders a red disk with center (240, 68) and radius 67 then Places a green dot at position (200, 230).
; PLAN: r0=171(x1), r1=130(y1), r2=356(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=240(x), r6=68(y), r7=67(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=200(x), r11=230(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 171
LDI r1, 130
LDI r2, 356
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 68
LDI r7, 67
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 200
LDI r11, 230
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
