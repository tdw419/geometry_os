; DESCRIPTION: Composite: Creates a purple rectangular region at (53, 135) spanning 19 by 68 pixels then Renders a cyan line between points (189, 131) and (169, 53).
; PLAN: r0=53(x), r1=135(y), r2=19(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=189(x1), r6=131(y1), r7=169(x2), r8=53(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 53
LDI r1, 135
LDI r2, 19
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 189
LDI r6, 131
LDI r7, 169
LDI r8, 53
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
