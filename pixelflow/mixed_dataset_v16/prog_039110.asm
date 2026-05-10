; DESCRIPTION: Composite: Places a yellow dot at position (59, 118) then Places a purple 90x11 rectangle at position (236, 100) then Renders a magenta line between points (153, 151) and (214, 37).
; PLAN: r0=59(x), r1=118(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=236(x), r6=100(y), r7=90(width), r8=11(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=153(x1), r11=151(y1), r12=214(x2), r13=37(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 59
LDI r1, 118
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 236
LDI r6, 100
LDI r7, 90
LDI r8, 11
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 153
LDI r11, 151
LDI r12, 214
LDI r13, 37
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
