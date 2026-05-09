; DESCRIPTION: Composite: Renders a blue line between points (394, 219) and (67, 114) then Draws a cyan rectangle at (32, 124) with width 81 and height 17 then Sets a single yellow pixel at (55, 157).
; PLAN: r0=394(x1), r1=219(y1), r2=67(x2), r3=114(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=32(x), r6=124(y), r7=81(width), r8=17(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=55(x), r11=157(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 394
LDI r1, 219
LDI r2, 67
LDI r3, 114
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 32
LDI r6, 124
LDI r7, 81
LDI r8, 17
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 55
LDI r11, 157
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
