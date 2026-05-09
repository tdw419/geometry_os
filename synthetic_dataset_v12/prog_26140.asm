; DESCRIPTION: Composite: Renders a black line between points (388, 202) and (79, 146) then Sets a single white pixel at (174, 173) then Places a green 72x89 rectangle at position (135, 89).
; PLAN: r0=388(x1), r1=202(y1), r2=79(x2), r3=146(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=174(x), r6=173(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=135(x), r11=89(y), r12=72(width), r13=89(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 388
LDI r1, 202
LDI r2, 79
LDI r3, 146
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 173
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 135
LDI r11, 89
LDI r12, 72
LDI r13, 89
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
