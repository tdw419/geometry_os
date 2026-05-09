; DESCRIPTION: Composite: Places a magenta circle of radius 24 at center (445, 135) then Draws a yellow line from (280, 46) to (474, 229) then Places a black dot at position (28, 235).
; PLAN: r0=445(x), r1=135(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=280(x1), r6=46(y1), r7=474(x2), r8=229(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=28(x), r11=235(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 445
LDI r1, 135
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 280
LDI r6, 46
LDI r7, 474
LDI r8, 229
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 28
LDI r11, 235
LDI r12, 0x000000
PSET r10, r11, r12
HALT
