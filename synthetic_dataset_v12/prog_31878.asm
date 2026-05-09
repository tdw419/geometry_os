; DESCRIPTION: Composite: Sets a single cyan pixel at (322, 36) then Draws a red line from (10, 10) to (252, 195) then Renders a blue box of size 34x60 starting at (469, 16).
; PLAN: r0=322(x), r1=36(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=10(x1), r6=10(y1), r7=252(x2), r8=195(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=469(x), r11=16(y), r12=34(width), r13=60(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 322
LDI r1, 36
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 10
LDI r6, 10
LDI r7, 252
LDI r8, 195
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 469
LDI r11, 16
LDI r12, 34
LDI r13, 60
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
