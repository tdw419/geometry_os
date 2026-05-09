; DESCRIPTION: Composite: Renders a magenta line between points (139, 213) and (402, 121) then Creates a white rectangular region at (440, 57) spanning 23 by 23 pixels.
; PLAN: r0=139(x1), r1=213(y1), r2=402(x2), r3=121(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=440(x), r6=57(y), r7=23(width), r8=23(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 139
LDI r1, 213
LDI r2, 402
LDI r3, 121
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 440
LDI r6, 57
LDI r7, 23
LDI r8, 23
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
