; DESCRIPTION: Composite: Renders a purple box of size 120x47 starting at (7, 0) then Places a red line segment connecting (182, 236) to (98, 166) then Sets a single red pixel at (56, 150).
; PLAN: r0=7(x), r1=0(y), r2=120(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=182(x1), r6=236(y1), r7=98(x2), r8=166(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=56(x), r11=150(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 7
LDI r1, 0
LDI r2, 120
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 182
LDI r6, 236
LDI r7, 98
LDI r8, 166
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 56
LDI r11, 150
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
