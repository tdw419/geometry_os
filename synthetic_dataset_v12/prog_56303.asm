; DESCRIPTION: Composite: Sets a single cyan pixel at (476, 68) then Renders a green box of size 11x26 starting at (388, 87) then Renders a cyan line between points (206, 154) and (126, 107).
; PLAN: r0=476(x), r1=68(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=388(x), r6=87(y), r7=11(width), r8=26(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=206(x1), r11=154(y1), r12=126(x2), r13=107(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 476
LDI r1, 68
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 388
LDI r6, 87
LDI r7, 11
LDI r8, 26
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 206
LDI r11, 154
LDI r12, 126
LDI r13, 107
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
