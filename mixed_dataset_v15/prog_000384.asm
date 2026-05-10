; DESCRIPTION: Composite: Sets a single magenta pixel at (182, 148) then Renders a white line between points (406, 88) and (165, 7) then Places a purple 102x61 rectangle at position (108, 54).
; PLAN: r0=182(x), r1=148(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=406(x1), r6=88(y1), r7=165(x2), r8=7(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=108(x), r11=54(y), r12=102(width), r13=61(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 182
LDI r1, 148
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 406
LDI r6, 88
LDI r7, 165
LDI r8, 7
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 108
LDI r11, 54
LDI r12, 102
LDI r13, 61
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
