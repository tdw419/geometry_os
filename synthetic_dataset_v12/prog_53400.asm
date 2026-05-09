; DESCRIPTION: Composite: Places a purple dot at position (164, 53) then Draws a yellow rectangle at (73, 101) with width 96 and height 83 then Renders a magenta line between points (113, 205) and (342, 223).
; PLAN: r0=164(x), r1=53(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=73(x), r6=101(y), r7=96(width), r8=83(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=113(x1), r11=205(y1), r12=342(x2), r13=223(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 164
LDI r1, 53
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 73
LDI r6, 101
LDI r7, 96
LDI r8, 83
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 113
LDI r11, 205
LDI r12, 342
LDI r13, 223
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
