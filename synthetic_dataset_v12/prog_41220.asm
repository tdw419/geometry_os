; DESCRIPTION: Composite: Creates a purple rectangular region at (151, 0) spanning 53 by 69 pixels then Draws a green line from (307, 195) to (30, 242) then Draws a green circle centered at (146, 152) with radius 17.
; PLAN: r0=151(x), r1=0(y), r2=53(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=307(x1), r6=195(y1), r7=30(x2), r8=242(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=146(x), r11=152(y), r12=17(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 151
LDI r1, 0
LDI r2, 53
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 195
LDI r7, 30
LDI r8, 242
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 146
LDI r11, 152
LDI r12, 17
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
