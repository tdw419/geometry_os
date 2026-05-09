; DESCRIPTION: Composite: Creates a cyan rectangular region at (39, 5) spanning 27 by 22 pixels then Renders a yellow line between points (389, 249) and (440, 130).
; PLAN: r0=39(x), r1=5(y), r2=27(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=389(x1), r6=249(y1), r7=440(x2), r8=130(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 39
LDI r1, 5
LDI r2, 27
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 389
LDI r6, 249
LDI r7, 440
LDI r8, 130
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
