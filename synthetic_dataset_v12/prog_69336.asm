; DESCRIPTION: Composite: Sets a single yellow pixel at (488, 196) then Draws a green rectangle at (101, 146) with width 71 and height 102 then Draws a blue line from (292, 96) to (172, 92).
; PLAN: r0=488(x), r1=196(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=101(x), r6=146(y), r7=71(width), r8=102(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=292(x1), r11=96(y1), r12=172(x2), r13=92(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 488
LDI r1, 196
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 101
LDI r6, 146
LDI r7, 71
LDI r8, 102
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 292
LDI r11, 96
LDI r12, 172
LDI r13, 92
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
