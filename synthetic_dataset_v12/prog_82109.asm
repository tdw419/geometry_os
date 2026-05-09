; DESCRIPTION: Composite: Places a yellow line segment connecting (255, 181) to (508, 242) then Renders a blue box of size 92x22 starting at (164, 22).
; PLAN: r0=255(x1), r1=181(y1), r2=508(x2), r3=242(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=164(x), r6=22(y), r7=92(width), r8=22(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 255
LDI r1, 181
LDI r2, 508
LDI r3, 242
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 22
LDI r7, 92
LDI r8, 22
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
