; DESCRIPTION: Composite: Renders a white box of size 92x108 starting at (340, 96) then Draws a green line from (355, 112) to (487, 126) then Places a purple dot at position (290, 88).
; PLAN: r0=340(x), r1=96(y), r2=92(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=355(x1), r6=112(y1), r7=487(x2), r8=126(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=290(x), r11=88(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 340
LDI r1, 96
LDI r2, 92
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 112
LDI r7, 487
LDI r8, 126
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 290
LDI r11, 88
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
