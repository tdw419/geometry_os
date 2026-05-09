; DESCRIPTION: Composite: Places a white line segment connecting (188, 162) to (503, 242) then Places a magenta dot at position (303, 130) then Renders a magenta box of size 108x118 starting at (265, 6).
; PLAN: r0=188(x1), r1=162(y1), r2=503(x2), r3=242(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=303(x), r6=130(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=265(x), r11=6(y), r12=108(width), r13=118(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 188
LDI r1, 162
LDI r2, 503
LDI r3, 242
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 130
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 265
LDI r11, 6
LDI r12, 108
LDI r13, 118
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
