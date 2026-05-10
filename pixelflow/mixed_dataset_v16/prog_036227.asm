; DESCRIPTION: Composite: Sets a single yellow pixel at (228, 37) then Renders a magenta line between points (71, 22) and (273, 119) then Renders a green box of size 79x48 starting at (36, 30).
; PLAN: r0=228(x), r1=37(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=71(x1), r6=22(y1), r7=273(x2), r8=119(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=36(x), r11=30(y), r12=79(width), r13=48(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 228
LDI r1, 37
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 71
LDI r6, 22
LDI r7, 273
LDI r8, 119
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 36
LDI r11, 30
LDI r12, 79
LDI r13, 48
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
