; DESCRIPTION: Composite: Renders a yellow line between points (484, 95) and (96, 149) then Creates a cyan rectangular region at (413, 103) spanning 50 by 91 pixels.
; PLAN: r0=484(x1), r1=95(y1), r2=96(x2), r3=149(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=413(x), r6=103(y), r7=50(width), r8=91(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 484
LDI r1, 95
LDI r2, 96
LDI r3, 149
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 413
LDI r6, 103
LDI r7, 50
LDI r8, 91
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
