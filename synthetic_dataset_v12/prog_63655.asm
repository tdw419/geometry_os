; DESCRIPTION: Composite: Creates a purple circular shape at (365, 171) with radius 73 then Places a magenta dot at position (154, 7) then Draws a purple line from (20, 11) to (417, 220).
; PLAN: r0=365(x), r1=171(y), r2=73(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=154(x), r6=7(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=20(x1), r11=11(y1), r12=417(x2), r13=220(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 365
LDI r1, 171
LDI r2, 73
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 154
LDI r6, 7
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 20
LDI r11, 11
LDI r12, 417
LDI r13, 220
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
