; DESCRIPTION: Composite: Places a green dot at position (284, 80) then Creates a red rectangular region at (72, 131) spanning 34 by 112 pixels then Renders a purple line between points (488, 102) and (432, 17).
; PLAN: r0=284(x), r1=80(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=72(x), r6=131(y), r7=34(width), r8=112(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=488(x1), r11=102(y1), r12=432(x2), r13=17(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 284
LDI r1, 80
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 72
LDI r6, 131
LDI r7, 34
LDI r8, 112
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 488
LDI r11, 102
LDI r12, 432
LDI r13, 17
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
