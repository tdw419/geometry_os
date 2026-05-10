; DESCRIPTION: Composite: Sets a single orange pixel at (6, 217) then Renders a magenta disk with center (445, 66) and radius 45 then Draws a red line from (255, 182) to (182, 56).
; PLAN: r0=6(x), r1=217(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=445(x), r6=66(y), r7=45(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=255(x1), r11=182(y1), r12=182(x2), r13=56(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 6
LDI r1, 217
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 445
LDI r6, 66
LDI r7, 45
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 255
LDI r11, 182
LDI r12, 182
LDI r13, 56
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
