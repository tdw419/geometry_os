; DESCRIPTION: Composite: Draws a white line from (246, 200) to (88, 90) then Creates a cyan circular shape at (127, 67) with radius 67 then Places a green dot at position (63, 61).
; PLAN: r0=246(x1), r1=200(y1), r2=88(x2), r3=90(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=127(x), r6=67(y), r7=67(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=63(x), r11=61(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 246
LDI r1, 200
LDI r2, 88
LDI r3, 90
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 127
LDI r6, 67
LDI r7, 67
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 63
LDI r11, 61
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
