; DESCRIPTION: Composite: Places a magenta line segment connecting (25, 42) to (273, 96) then Renders a magenta box of size 92x80 starting at (405, 156) then Sets a single red pixel at (494, 146).
; PLAN: r0=25(x1), r1=42(y1), r2=273(x2), r3=96(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=405(x), r6=156(y), r7=92(width), r8=80(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=494(x), r11=146(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 25
LDI r1, 42
LDI r2, 273
LDI r3, 96
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 156
LDI r7, 92
LDI r8, 80
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 494
LDI r11, 146
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
