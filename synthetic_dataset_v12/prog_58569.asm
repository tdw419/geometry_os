; DESCRIPTION: Composite: Sets a single blue pixel at (239, 63) then Renders a purple box of size 44x48 starting at (167, 21) then Draws a red line from (456, 199) to (349, 72).
; PLAN: r0=239(x), r1=63(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=167(x), r6=21(y), r7=44(width), r8=48(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=456(x1), r11=199(y1), r12=349(x2), r13=72(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 239
LDI r1, 63
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 167
LDI r6, 21
LDI r7, 44
LDI r8, 48
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 456
LDI r11, 199
LDI r12, 349
LDI r13, 72
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
