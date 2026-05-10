; DESCRIPTION: Composite: Sets a single magenta pixel at (345, 196) then Draws a cyan line from (14, 248) to (152, 14) then Renders a red box of size 69x106 starting at (83, 45).
; PLAN: r0=345(x), r1=196(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=14(x1), r6=248(y1), r7=152(x2), r8=14(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=83(x), r11=45(y), r12=69(width), r13=106(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 345
LDI r1, 196
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 14
LDI r6, 248
LDI r7, 152
LDI r8, 14
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 83
LDI r11, 45
LDI r12, 69
LDI r13, 106
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
