; DESCRIPTION: Composite: Places a purple dot at position (256, 177) then Renders a red line between points (460, 56) and (106, 205) then Places a orange 51x94 rectangle at position (358, 83).
; PLAN: r0=256(x), r1=177(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=460(x1), r6=56(y1), r7=106(x2), r8=205(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=358(x), r11=83(y), r12=51(width), r13=94(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 256
LDI r1, 177
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 460
LDI r6, 56
LDI r7, 106
LDI r8, 205
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 358
LDI r11, 83
LDI r12, 51
LDI r13, 94
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
