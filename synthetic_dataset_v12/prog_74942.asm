; DESCRIPTION: Composite: Creates a green rectangular region at (404, 146) spanning 86 by 58 pixels then Places a cyan line segment connecting (130, 163) to (250, 171).
; PLAN: r0=404(x), r1=146(y), r2=86(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=130(x1), r6=163(y1), r7=250(x2), r8=171(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 404
LDI r1, 146
LDI r2, 86
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 163
LDI r7, 250
LDI r8, 171
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
