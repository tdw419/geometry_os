; DESCRIPTION: Composite: Renders a black line between points (174, 67) and (427, 205) then Places a purple 99x42 rectangle at position (369, 55).
; PLAN: r0=174(x1), r1=67(y1), r2=427(x2), r3=205(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=369(x), r6=55(y), r7=99(width), r8=42(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 174
LDI r1, 67
LDI r2, 427
LDI r3, 205
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 369
LDI r6, 55
LDI r7, 99
LDI r8, 42
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
