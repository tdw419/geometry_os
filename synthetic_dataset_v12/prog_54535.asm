; DESCRIPTION: Composite: Sets a single black pixel at (297, 22) then Places a green 61x23 rectangle at position (400, 79) then Renders a blue line between points (81, 60) and (195, 248).
; PLAN: r0=297(x), r1=22(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=400(x), r6=79(y), r7=61(width), r8=23(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=81(x1), r11=60(y1), r12=195(x2), r13=248(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 297
LDI r1, 22
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 400
LDI r6, 79
LDI r7, 61
LDI r8, 23
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 81
LDI r11, 60
LDI r12, 195
LDI r13, 248
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
