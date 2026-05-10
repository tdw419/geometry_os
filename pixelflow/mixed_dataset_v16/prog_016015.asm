; DESCRIPTION: Composite: Places a green dot at position (158, 153) then Draws a yellow line from (213, 12) to (317, 107) then Renders a orange box of size 96x120 starting at (117, 73).
; PLAN: r0=158(x), r1=153(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=213(x1), r6=12(y1), r7=317(x2), r8=107(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=117(x), r11=73(y), r12=96(width), r13=120(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 158
LDI r1, 153
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 213
LDI r6, 12
LDI r7, 317
LDI r8, 107
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 117
LDI r11, 73
LDI r12, 96
LDI r13, 120
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
