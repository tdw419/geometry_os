; DESCRIPTION: Composite: Places a cyan dot at position (350, 198) then Places a magenta 63x91 rectangle at position (92, 70) then Places a blue line segment connecting (326, 43) to (320, 221).
; PLAN: r0=350(x), r1=198(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=92(x), r6=70(y), r7=63(width), r8=91(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=326(x1), r11=43(y1), r12=320(x2), r13=221(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 350
LDI r1, 198
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 92
LDI r6, 70
LDI r7, 63
LDI r8, 91
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 326
LDI r11, 43
LDI r12, 320
LDI r13, 221
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
