; DESCRIPTION: Composite: Renders a blue box of size 74x69 starting at (49, 129) then Draws a purple line from (152, 64) to (407, 190) then Sets a single cyan pixel at (73, 132).
; PLAN: r0=49(x), r1=129(y), r2=74(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=152(x1), r6=64(y1), r7=407(x2), r8=190(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=73(x), r11=132(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 49
LDI r1, 129
LDI r2, 74
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 152
LDI r6, 64
LDI r7, 407
LDI r8, 190
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 73
LDI r11, 132
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
