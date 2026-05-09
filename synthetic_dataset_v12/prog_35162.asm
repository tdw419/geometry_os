; DESCRIPTION: Composite: Sets a single red pixel at (159, 38) then Draws a yellow line from (494, 114) to (173, 180) then Renders a yellow box of size 113x99 starting at (221, 20).
; PLAN: r0=159(x), r1=38(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=494(x1), r6=114(y1), r7=173(x2), r8=180(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=221(x), r11=20(y), r12=113(width), r13=99(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 159
LDI r1, 38
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 494
LDI r6, 114
LDI r7, 173
LDI r8, 180
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 221
LDI r11, 20
LDI r12, 113
LDI r13, 99
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
