; DESCRIPTION: Composite: Places a magenta dot at position (103, 146) then Renders a yellow line between points (40, 45) and (424, 176) then Renders a yellow box of size 32x23 starting at (420, 67).
; PLAN: r0=103(x), r1=146(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=40(x1), r6=45(y1), r7=424(x2), r8=176(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=420(x), r11=67(y), r12=32(width), r13=23(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 103
LDI r1, 146
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 40
LDI r6, 45
LDI r7, 424
LDI r8, 176
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 420
LDI r11, 67
LDI r12, 32
LDI r13, 23
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
