; DESCRIPTION: Composite: Creates a red rectangular region at (111, 110) spanning 92 by 116 pixels then Renders a red line between points (401, 196) and (389, 8) then Places a yellow dot at position (116, 69).
; PLAN: r0=111(x), r1=110(y), r2=92(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=401(x1), r6=196(y1), r7=389(x2), r8=8(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=116(x), r11=69(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 111
LDI r1, 110
LDI r2, 92
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 196
LDI r7, 389
LDI r8, 8
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 116
LDI r11, 69
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
