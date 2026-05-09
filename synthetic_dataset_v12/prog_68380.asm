; DESCRIPTION: Composite: Renders a magenta line between points (200, 194) and (496, 95) then Places a blue 11x68 rectangle at position (368, 7).
; PLAN: r0=200(x1), r1=194(y1), r2=496(x2), r3=95(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=368(x), r6=7(y), r7=11(width), r8=68(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 200
LDI r1, 194
LDI r2, 496
LDI r3, 95
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 7
LDI r7, 11
LDI r8, 68
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
