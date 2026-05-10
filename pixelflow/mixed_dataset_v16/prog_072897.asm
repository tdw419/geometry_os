; DESCRIPTION: Composite: Places a purple dot at position (392, 17) then Renders a magenta box of size 75x120 starting at (221, 115) then Places a magenta line segment connecting (251, 250) to (343, 183).
; PLAN: r0=392(x), r1=17(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=221(x), r6=115(y), r7=75(width), r8=120(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=251(x1), r11=250(y1), r12=343(x2), r13=183(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 392
LDI r1, 17
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 221
LDI r6, 115
LDI r7, 75
LDI r8, 120
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 251
LDI r11, 250
LDI r12, 343
LDI r13, 183
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
