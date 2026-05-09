; DESCRIPTION: Composite: Places a green dot at position (320, 211) then Places a orange line segment connecting (418, 20) to (467, 131) then Renders a red box of size 49x77 starting at (175, 51).
; PLAN: r0=320(x), r1=211(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=418(x1), r6=20(y1), r7=467(x2), r8=131(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=175(x), r11=51(y), r12=49(width), r13=77(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 320
LDI r1, 211
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 418
LDI r6, 20
LDI r7, 467
LDI r8, 131
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 175
LDI r11, 51
LDI r12, 49
LDI r13, 77
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
