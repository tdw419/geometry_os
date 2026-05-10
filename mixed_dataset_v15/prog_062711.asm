; DESCRIPTION: Composite: Sets a single magenta pixel at (13, 96) then Places a blue 86x101 rectangle at position (426, 84) then Places a cyan line segment connecting (13, 133) to (307, 221).
; PLAN: r0=13(x), r1=96(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=426(x), r6=84(y), r7=86(width), r8=101(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=13(x1), r11=133(y1), r12=307(x2), r13=221(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 13
LDI r1, 96
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 426
LDI r6, 84
LDI r7, 86
LDI r8, 101
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 13
LDI r11, 133
LDI r12, 307
LDI r13, 221
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
