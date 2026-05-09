; DESCRIPTION: Composite: Renders a white box of size 91x106 starting at (256, 135) then Renders a white line between points (436, 217) and (405, 163).
; PLAN: r0=256(x), r1=135(y), r2=91(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=436(x1), r6=217(y1), r7=405(x2), r8=163(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 256
LDI r1, 135
LDI r2, 91
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 436
LDI r6, 217
LDI r7, 405
LDI r8, 163
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
