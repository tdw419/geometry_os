; DESCRIPTION: Composite: Renders a red box of size 80x42 starting at (369, 177) then Renders a magenta line between points (230, 129) and (156, 63) then Places a red dot at position (441, 138).
; PLAN: r0=369(x), r1=177(y), r2=80(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=230(x1), r6=129(y1), r7=156(x2), r8=63(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=441(x), r11=138(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 369
LDI r1, 177
LDI r2, 80
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 129
LDI r7, 156
LDI r8, 63
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 441
LDI r11, 138
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
