; DESCRIPTION: Composite: Creates a cyan rectangular region at (146, 14) spanning 37 by 111 pixels then Renders a magenta line between points (353, 172) and (411, 48).
; PLAN: r0=146(x), r1=14(y), r2=37(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=353(x1), r6=172(y1), r7=411(x2), r8=48(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 146
LDI r1, 14
LDI r2, 37
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 353
LDI r6, 172
LDI r7, 411
LDI r8, 48
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
