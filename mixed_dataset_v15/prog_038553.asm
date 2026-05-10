; DESCRIPTION: Composite: Creates a green rectangular region at (337, 71) spanning 63 by 113 pixels then Draws a magenta line from (356, 63) to (392, 250) then Sets a single white pixel at (394, 75).
; PLAN: r0=337(x), r1=71(y), r2=63(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=356(x1), r6=63(y1), r7=392(x2), r8=250(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=394(x), r11=75(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 337
LDI r1, 71
LDI r2, 63
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 356
LDI r6, 63
LDI r7, 392
LDI r8, 250
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 394
LDI r11, 75
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
