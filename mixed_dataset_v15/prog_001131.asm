; DESCRIPTION: Composite: Creates a blue rectangular region at (228, 136) spanning 73 by 120 pixels then Renders a magenta line between points (161, 73) and (313, 230).
; PLAN: r0=228(x), r1=136(y), r2=73(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=161(x1), r6=73(y1), r7=313(x2), r8=230(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 228
LDI r1, 136
LDI r2, 73
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 73
LDI r7, 313
LDI r8, 230
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
