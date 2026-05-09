; DESCRIPTION: Composite: Renders a purple line between points (80, 226) and (164, 142) then Renders a magenta box of size 88x64 starting at (137, 74) then Places a green dot at position (370, 142).
; PLAN: r0=80(x1), r1=226(y1), r2=164(x2), r3=142(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=137(x), r6=74(y), r7=88(width), r8=64(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=370(x), r11=142(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 80
LDI r1, 226
LDI r2, 164
LDI r3, 142
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 74
LDI r7, 88
LDI r8, 64
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 370
LDI r11, 142
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
