; DESCRIPTION: Composite: Creates a red rectangular region at (177, 142) spanning 111 by 51 pixels then Renders a white line between points (213, 4) and (91, 98) then Places a magenta dot at position (407, 205).
; PLAN: r0=177(x), r1=142(y), r2=111(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=213(x1), r6=4(y1), r7=91(x2), r8=98(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=407(x), r11=205(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 177
LDI r1, 142
LDI r2, 111
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 4
LDI r7, 91
LDI r8, 98
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 407
LDI r11, 205
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
