; DESCRIPTION: Composite: Renders a black line between points (104, 87) and (511, 166) then Creates a blue rectangular region at (42, 35) spanning 65 by 103 pixels.
; PLAN: r0=104(x1), r1=87(y1), r2=511(x2), r3=166(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=42(x), r6=35(y), r7=65(width), r8=103(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 104
LDI r1, 87
LDI r2, 511
LDI r3, 166
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 42
LDI r6, 35
LDI r7, 65
LDI r8, 103
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
