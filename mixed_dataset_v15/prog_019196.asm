; DESCRIPTION: Composite: Creates a magenta rectangular region at (146, 38) spanning 78 by 67 pixels then Renders a green line between points (277, 73) and (164, 254) then Creates a green circular shape at (313, 131) with radius 66.
; PLAN: r0=146(x), r1=38(y), r2=78(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=277(x1), r6=73(y1), r7=164(x2), r8=254(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=313(x), r11=131(y), r12=66(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 146
LDI r1, 38
LDI r2, 78
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 73
LDI r7, 164
LDI r8, 254
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 313
LDI r11, 131
LDI r12, 66
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
