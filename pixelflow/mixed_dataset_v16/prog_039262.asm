; DESCRIPTION: Composite: Places a green dot at position (192, 113) then Creates a cyan rectangular region at (221, 37) spanning 65 by 87 pixels then Draws a cyan line from (412, 234) to (375, 213).
; PLAN: r0=192(x), r1=113(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=221(x), r6=37(y), r7=65(width), r8=87(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=412(x1), r11=234(y1), r12=375(x2), r13=213(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 192
LDI r1, 113
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 221
LDI r6, 37
LDI r7, 65
LDI r8, 87
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 412
LDI r11, 234
LDI r12, 375
LDI r13, 213
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
