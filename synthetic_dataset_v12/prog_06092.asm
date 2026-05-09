; DESCRIPTION: Composite: Sets a single magenta pixel at (281, 22) then Renders a yellow box of size 68x40 starting at (17, 153) then Renders a blue line between points (5, 7) and (502, 247).
; PLAN: r0=281(x), r1=22(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=17(x), r6=153(y), r7=68(width), r8=40(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=5(x1), r11=7(y1), r12=502(x2), r13=247(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 281
LDI r1, 22
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 17
LDI r6, 153
LDI r7, 68
LDI r8, 40
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 5
LDI r11, 7
LDI r12, 502
LDI r13, 247
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
