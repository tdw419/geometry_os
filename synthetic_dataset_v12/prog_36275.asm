; DESCRIPTION: Composite: Places a red dot at position (362, 101) then Places a green line segment connecting (105, 85) to (21, 60) then Renders a white box of size 99x20 starting at (370, 123).
; PLAN: r0=362(x), r1=101(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=105(x1), r6=85(y1), r7=21(x2), r8=60(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=370(x), r11=123(y), r12=99(width), r13=20(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 362
LDI r1, 101
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 105
LDI r6, 85
LDI r7, 21
LDI r8, 60
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 370
LDI r11, 123
LDI r12, 99
LDI r13, 20
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
