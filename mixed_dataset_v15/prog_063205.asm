; DESCRIPTION: Composite: Renders a black box of size 57x113 starting at (218, 65) then Renders a magenta line between points (323, 67) and (188, 90) then Sets a single black pixel at (263, 25).
; PLAN: r0=218(x), r1=65(y), r2=57(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=323(x1), r6=67(y1), r7=188(x2), r8=90(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=263(x), r11=25(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 218
LDI r1, 65
LDI r2, 57
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 323
LDI r6, 67
LDI r7, 188
LDI r8, 90
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 263
LDI r11, 25
LDI r12, 0x000000
PSET r10, r11, r12
HALT
