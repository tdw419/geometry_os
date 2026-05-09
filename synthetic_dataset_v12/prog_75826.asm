; DESCRIPTION: Composite: Places a magenta line segment connecting (18, 55) to (388, 163) then Places a orange 116x81 rectangle at position (317, 21).
; PLAN: r0=18(x1), r1=55(y1), r2=388(x2), r3=163(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=317(x), r6=21(y), r7=116(width), r8=81(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 18
LDI r1, 55
LDI r2, 388
LDI r3, 163
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 21
LDI r7, 116
LDI r8, 81
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
