; DESCRIPTION: Composite: Sets a single green pixel at (468, 48) then Renders a green line between points (283, 203) and (468, 205) then Draws a red rectangle at (82, 168) with width 49 and height 77.
; PLAN: r0=468(x), r1=48(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=283(x1), r6=203(y1), r7=468(x2), r8=205(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=82(x), r11=168(y), r12=49(width), r13=77(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 468
LDI r1, 48
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 283
LDI r6, 203
LDI r7, 468
LDI r8, 205
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 82
LDI r11, 168
LDI r12, 49
LDI r13, 77
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
