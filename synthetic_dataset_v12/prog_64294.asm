; DESCRIPTION: Composite: Draws a magenta line from (498, 243) to (127, 218) then Renders a white disk with center (268, 203) and radius 28.
; PLAN: r0=498(x1), r1=243(y1), r2=127(x2), r3=218(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=268(x), r6=203(y), r7=28(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 498
LDI r1, 243
LDI r2, 127
LDI r3, 218
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 268
LDI r6, 203
LDI r7, 28
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
