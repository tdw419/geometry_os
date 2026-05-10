; DESCRIPTION: Composite: Draws a cyan line from (163, 186) to (367, 133) then Creates a white rectangular region at (237, 113) spanning 118 by 103 pixels.
; PLAN: r0=163(x1), r1=186(y1), r2=367(x2), r3=133(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=237(x), r6=113(y), r7=118(width), r8=103(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 163
LDI r1, 186
LDI r2, 367
LDI r3, 133
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 113
LDI r7, 118
LDI r8, 103
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
