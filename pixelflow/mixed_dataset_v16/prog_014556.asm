; DESCRIPTION: Composite: Sets a single green pixel at (282, 0) then Renders a white box of size 109x39 starting at (82, 31) then Draws a black line from (492, 177) to (28, 52).
; PLAN: r0=282(x), r1=0(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=82(x), r6=31(y), r7=109(width), r8=39(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=492(x1), r11=177(y1), r12=28(x2), r13=52(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 282
LDI r1, 0
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 82
LDI r6, 31
LDI r7, 109
LDI r8, 39
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 492
LDI r11, 177
LDI r12, 28
LDI r13, 52
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
