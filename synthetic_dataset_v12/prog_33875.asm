; DESCRIPTION: Composite: Renders a blue box of size 55x13 starting at (214, 216) then Renders a magenta line between points (388, 98) and (156, 92).
; PLAN: r0=214(x), r1=216(y), r2=55(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=388(x1), r6=98(y1), r7=156(x2), r8=92(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 214
LDI r1, 216
LDI r2, 55
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 98
LDI r7, 156
LDI r8, 92
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
