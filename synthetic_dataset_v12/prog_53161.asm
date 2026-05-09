; DESCRIPTION: Composite: Creates a green rectangular region at (228, 13) spanning 99 by 39 pixels then Renders a black line between points (210, 241) and (91, 84).
; PLAN: r0=228(x), r1=13(y), r2=99(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=210(x1), r6=241(y1), r7=91(x2), r8=84(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 228
LDI r1, 13
LDI r2, 99
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 210
LDI r6, 241
LDI r7, 91
LDI r8, 84
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
