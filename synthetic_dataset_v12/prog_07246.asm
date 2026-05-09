; DESCRIPTION: Composite: Sets a single blue pixel at (53, 93) then Draws a red line from (64, 243) to (340, 225) then Places a green 29x99 rectangle at position (448, 78).
; PLAN: r0=53(x), r1=93(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=64(x1), r6=243(y1), r7=340(x2), r8=225(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=448(x), r11=78(y), r12=29(width), r13=99(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 53
LDI r1, 93
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 64
LDI r6, 243
LDI r7, 340
LDI r8, 225
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 448
LDI r11, 78
LDI r12, 29
LDI r13, 99
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
