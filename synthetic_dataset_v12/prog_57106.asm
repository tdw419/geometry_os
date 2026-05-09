; DESCRIPTION: Composite: Creates a orange rectangular region at (299, 149) spanning 22 by 98 pixels then Renders a red line between points (241, 205) and (72, 240).
; PLAN: r0=299(x), r1=149(y), r2=22(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=241(x1), r6=205(y1), r7=72(x2), r8=240(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 299
LDI r1, 149
LDI r2, 22
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 205
LDI r7, 72
LDI r8, 240
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
