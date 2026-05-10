; DESCRIPTION: Composite: Creates a red rectangular region at (261, 5) spanning 77 by 48 pixels then Renders a red line between points (393, 45) and (487, 85).
; PLAN: r0=261(x), r1=5(y), r2=77(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=393(x1), r6=45(y1), r7=487(x2), r8=85(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 261
LDI r1, 5
LDI r2, 77
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 393
LDI r6, 45
LDI r7, 487
LDI r8, 85
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
