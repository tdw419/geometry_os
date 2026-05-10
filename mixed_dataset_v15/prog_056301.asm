; DESCRIPTION: Composite: Renders a yellow box of size 22x67 starting at (331, 39) then Renders a cyan line between points (35, 242) and (259, 122) then Renders a green disk with center (307, 174) and radius 51.
; PLAN: r0=331(x), r1=39(y), r2=22(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=35(x1), r6=242(y1), r7=259(x2), r8=122(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=307(x), r11=174(y), r12=51(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 331
LDI r1, 39
LDI r2, 22
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 35
LDI r6, 242
LDI r7, 259
LDI r8, 122
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 307
LDI r11, 174
LDI r12, 51
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
