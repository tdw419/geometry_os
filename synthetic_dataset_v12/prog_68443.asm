; DESCRIPTION: Composite: Places a blue line segment connecting (156, 116) to (259, 0) then Places a red 85x63 rectangle at position (341, 57).
; PLAN: r0=156(x1), r1=116(y1), r2=259(x2), r3=0(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=341(x), r6=57(y), r7=85(width), r8=63(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 156
LDI r1, 116
LDI r2, 259
LDI r3, 0
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 341
LDI r6, 57
LDI r7, 85
LDI r8, 63
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
