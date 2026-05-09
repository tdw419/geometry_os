; DESCRIPTION: Composite: Renders a purple box of size 39x100 starting at (235, 6) then Renders a purple line between points (162, 3) and (415, 82) then Places a cyan dot at position (261, 144).
; PLAN: r0=235(x), r1=6(y), r2=39(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=162(x1), r6=3(y1), r7=415(x2), r8=82(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=261(x), r11=144(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 235
LDI r1, 6
LDI r2, 39
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 162
LDI r6, 3
LDI r7, 415
LDI r8, 82
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 261
LDI r11, 144
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
