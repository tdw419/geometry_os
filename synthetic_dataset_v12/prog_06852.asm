; DESCRIPTION: Composite: Places a cyan dot at position (0, 96) then Renders a yellow box of size 34x72 starting at (270, 17) then Places a green line segment connecting (374, 99) to (210, 176).
; PLAN: r0=0(x), r1=96(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=270(x), r6=17(y), r7=34(width), r8=72(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=374(x1), r11=99(y1), r12=210(x2), r13=176(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 0
LDI r1, 96
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 270
LDI r6, 17
LDI r7, 34
LDI r8, 72
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 374
LDI r11, 99
LDI r12, 210
LDI r13, 176
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
