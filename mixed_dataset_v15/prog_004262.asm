; DESCRIPTION: Composite: Places a green 71x64 rectangle at position (241, 16) then Draws a black line from (19, 128) to (157, 129) then Places a blue dot at position (29, 106).
; PLAN: r0=241(x), r1=16(y), r2=71(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=19(x1), r6=128(y1), r7=157(x2), r8=129(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=29(x), r11=106(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 241
LDI r1, 16
LDI r2, 71
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 19
LDI r6, 128
LDI r7, 157
LDI r8, 129
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 29
LDI r11, 106
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
