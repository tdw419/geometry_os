; DESCRIPTION: Composite: Renders a magenta line between points (415, 188) and (204, 57) then Places a black 67x64 rectangle at position (106, 43) then Places a orange dot at position (141, 243).
; PLAN: r0=415(x1), r1=188(y1), r2=204(x2), r3=57(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=106(x), r6=43(y), r7=67(width), r8=64(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=141(x), r11=243(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 415
LDI r1, 188
LDI r2, 204
LDI r3, 57
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 43
LDI r7, 67
LDI r8, 64
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 141
LDI r11, 243
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
