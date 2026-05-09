; DESCRIPTION: Composite: Draws a magenta line from (37, 129) to (323, 203) then Renders a black box of size 117x28 starting at (242, 91) then Sets a single white pixel at (269, 87).
; PLAN: r0=37(x1), r1=129(y1), r2=323(x2), r3=203(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=242(x), r6=91(y), r7=117(width), r8=28(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=269(x), r11=87(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 37
LDI r1, 129
LDI r2, 323
LDI r3, 203
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 242
LDI r6, 91
LDI r7, 117
LDI r8, 28
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 269
LDI r11, 87
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
