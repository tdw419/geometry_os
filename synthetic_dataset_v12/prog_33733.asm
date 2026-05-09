; DESCRIPTION: Composite: Sets a single purple pixel at (356, 27) then Renders a orange box of size 41x79 starting at (253, 164) then Draws a magenta line from (217, 163) to (349, 182).
; PLAN: r0=356(x), r1=27(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=253(x), r6=164(y), r7=41(width), r8=79(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=217(x1), r11=163(y1), r12=349(x2), r13=182(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 356
LDI r1, 27
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 253
LDI r6, 164
LDI r7, 41
LDI r8, 79
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 217
LDI r11, 163
LDI r12, 349
LDI r13, 182
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
