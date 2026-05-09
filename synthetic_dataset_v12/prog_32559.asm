; DESCRIPTION: Composite: Renders a purple box of size 73x104 starting at (337, 39) then Renders a white line between points (169, 226) and (379, 102).
; PLAN: r0=337(x), r1=39(y), r2=73(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=169(x1), r6=226(y1), r7=379(x2), r8=102(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 337
LDI r1, 39
LDI r2, 73
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 169
LDI r6, 226
LDI r7, 379
LDI r8, 102
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
