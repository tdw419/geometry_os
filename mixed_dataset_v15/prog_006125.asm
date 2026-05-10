; DESCRIPTION: Composite: Draws a magenta line from (405, 236) to (58, 164) then Renders a magenta box of size 14x33 starting at (453, 62) then Sets a single white pixel at (307, 92).
; PLAN: r0=405(x1), r1=236(y1), r2=58(x2), r3=164(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=453(x), r6=62(y), r7=14(width), r8=33(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=307(x), r11=92(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 405
LDI r1, 236
LDI r2, 58
LDI r3, 164
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 453
LDI r6, 62
LDI r7, 14
LDI r8, 33
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 307
LDI r11, 92
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
