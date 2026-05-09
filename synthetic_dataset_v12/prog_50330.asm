; DESCRIPTION: Composite: Creates a green rectangular region at (336, 82) spanning 41 by 57 pixels then Renders a cyan line between points (280, 133) and (19, 169).
; PLAN: r0=336(x), r1=82(y), r2=41(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=280(x1), r6=133(y1), r7=19(x2), r8=169(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 336
LDI r1, 82
LDI r2, 41
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 133
LDI r7, 19
LDI r8, 169
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
