; DESCRIPTION: Composite: Sets a single white pixel at (509, 1) then Draws a blue line from (7, 69) to (51, 197) then Renders a black box of size 36x117 starting at (365, 40).
; PLAN: r0=509(x), r1=1(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=7(x1), r6=69(y1), r7=51(x2), r8=197(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=365(x), r11=40(y), r12=36(width), r13=117(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 509
LDI r1, 1
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 7
LDI r6, 69
LDI r7, 51
LDI r8, 197
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 365
LDI r11, 40
LDI r12, 36
LDI r13, 117
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
