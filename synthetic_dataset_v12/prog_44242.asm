; DESCRIPTION: Composite: Creates a cyan rectangular region at (299, 92) spanning 28 by 114 pixels then Draws a blue line from (123, 144) to (462, 237).
; PLAN: r0=299(x), r1=92(y), r2=28(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=123(x1), r6=144(y1), r7=462(x2), r8=237(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 299
LDI r1, 92
LDI r2, 28
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 144
LDI r7, 462
LDI r8, 237
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
