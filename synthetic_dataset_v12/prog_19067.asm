; DESCRIPTION: Composite: Creates a cyan rectangular region at (264, 122) spanning 10 by 20 pixels then Renders a white line between points (231, 229) and (45, 34).
; PLAN: r0=264(x), r1=122(y), r2=10(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=231(x1), r6=229(y1), r7=45(x2), r8=34(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 264
LDI r1, 122
LDI r2, 10
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 231
LDI r6, 229
LDI r7, 45
LDI r8, 34
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
