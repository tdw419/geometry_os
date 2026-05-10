; DESCRIPTION: Composite: Draws a blue line from (298, 208) to (206, 12) then Places a blue 36x81 rectangle at position (141, 23) then Renders a cyan disk with center (481, 155) and radius 27.
; PLAN: r0=298(x1), r1=208(y1), r2=206(x2), r3=12(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=141(x), r6=23(y), r7=36(width), r8=81(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=481(x), r11=155(y), r12=27(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 298
LDI r1, 208
LDI r2, 206
LDI r3, 12
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 23
LDI r7, 36
LDI r8, 81
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 481
LDI r11, 155
LDI r12, 27
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
