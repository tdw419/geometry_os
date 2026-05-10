; DESCRIPTION: Composite: Places a orange dot at position (112, 250) then Draws a red line from (156, 11) to (224, 232) then Renders a cyan box of size 33x82 starting at (59, 15).
; PLAN: r0=112(x), r1=250(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=156(x1), r6=11(y1), r7=224(x2), r8=232(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=59(x), r11=15(y), r12=33(width), r13=82(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 112
LDI r1, 250
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 156
LDI r6, 11
LDI r7, 224
LDI r8, 232
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 59
LDI r11, 15
LDI r12, 33
LDI r13, 82
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
