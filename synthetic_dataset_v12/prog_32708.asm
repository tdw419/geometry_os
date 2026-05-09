; DESCRIPTION: Composite: Sets a single cyan pixel at (69, 246) then Creates a blue rectangular region at (280, 57) spanning 20 by 100 pixels then Places a cyan line segment connecting (337, 211) to (313, 190).
; PLAN: r0=69(x), r1=246(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=280(x), r6=57(y), r7=20(width), r8=100(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=337(x1), r11=211(y1), r12=313(x2), r13=190(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 69
LDI r1, 246
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 280
LDI r6, 57
LDI r7, 20
LDI r8, 100
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 337
LDI r11, 211
LDI r12, 313
LDI r13, 190
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
