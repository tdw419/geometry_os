; DESCRIPTION: Composite: Draws a cyan line from (491, 132) to (147, 71) then Renders a yellow box of size 87x28 starting at (355, 173).
; PLAN: r0=491(x1), r1=132(y1), r2=147(x2), r3=71(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=355(x), r6=173(y), r7=87(width), r8=28(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 491
LDI r1, 132
LDI r2, 147
LDI r3, 71
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 173
LDI r7, 87
LDI r8, 28
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
