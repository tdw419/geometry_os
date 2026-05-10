; DESCRIPTION: Composite: Places a cyan 79x90 rectangle at position (53, 4) then Renders a purple line between points (75, 162) and (67, 112) then Sets a single cyan pixel at (474, 164).
; PLAN: r0=53(x), r1=4(y), r2=79(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=75(x1), r6=162(y1), r7=67(x2), r8=112(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=474(x), r11=164(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 53
LDI r1, 4
LDI r2, 79
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 162
LDI r7, 67
LDI r8, 112
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 474
LDI r11, 164
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
