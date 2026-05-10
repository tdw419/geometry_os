; DESCRIPTION: Composite: Places a magenta 89x65 rectangle at position (10, 28) then Renders a red line between points (394, 14) and (496, 68).
; PLAN: r0=10(x), r1=28(y), r2=89(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=394(x1), r6=14(y1), r7=496(x2), r8=68(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 10
LDI r1, 28
LDI r2, 89
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 394
LDI r6, 14
LDI r7, 496
LDI r8, 68
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
