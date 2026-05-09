; DESCRIPTION: Composite: Creates a orange rectangular region at (141, 2) spanning 47 by 87 pixels then Renders a cyan line between points (202, 82) and (336, 129).
; PLAN: r0=141(x), r1=2(y), r2=47(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=202(x1), r6=82(y1), r7=336(x2), r8=129(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 141
LDI r1, 2
LDI r2, 47
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 82
LDI r7, 336
LDI r8, 129
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
