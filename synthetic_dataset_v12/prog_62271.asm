; DESCRIPTION: Composite: Sets a single cyan pixel at (387, 42) then Draws a green circle centered at (334, 164) with radius 54 then Renders a purple line between points (232, 242) and (209, 121).
; PLAN: r0=387(x), r1=42(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=334(x), r6=164(y), r7=54(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=232(x1), r11=242(y1), r12=209(x2), r13=121(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 387
LDI r1, 42
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 334
LDI r6, 164
LDI r7, 54
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 232
LDI r11, 242
LDI r12, 209
LDI r13, 121
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
