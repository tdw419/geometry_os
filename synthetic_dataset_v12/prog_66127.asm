; DESCRIPTION: Composite: Renders a cyan box of size 44x29 starting at (292, 199) then Places a black line segment connecting (415, 30) to (115, 52) then Places a magenta dot at position (237, 135).
; PLAN: r0=292(x), r1=199(y), r2=44(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=415(x1), r6=30(y1), r7=115(x2), r8=52(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=237(x), r11=135(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 292
LDI r1, 199
LDI r2, 44
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 30
LDI r7, 115
LDI r8, 52
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 237
LDI r11, 135
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
