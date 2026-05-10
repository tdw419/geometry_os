; DESCRIPTION: Composite: Sets a single white pixel at (127, 201) then Renders a white line between points (12, 96) and (464, 37) then Places a orange 60x117 rectangle at position (377, 130).
; PLAN: r0=127(x), r1=201(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=12(x1), r6=96(y1), r7=464(x2), r8=37(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=377(x), r11=130(y), r12=60(width), r13=117(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 127
LDI r1, 201
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 12
LDI r6, 96
LDI r7, 464
LDI r8, 37
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 377
LDI r11, 130
LDI r12, 60
LDI r13, 117
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
