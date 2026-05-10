; DESCRIPTION: Composite: Draws a yellow line from (311, 31) to (116, 218) then Renders a green box of size 16x72 starting at (403, 139) then Sets a single magenta pixel at (59, 189).
; PLAN: r0=311(x1), r1=31(y1), r2=116(x2), r3=218(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=403(x), r6=139(y), r7=16(width), r8=72(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=59(x), r11=189(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 311
LDI r1, 31
LDI r2, 116
LDI r3, 218
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 403
LDI r6, 139
LDI r7, 16
LDI r8, 72
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 59
LDI r11, 189
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
