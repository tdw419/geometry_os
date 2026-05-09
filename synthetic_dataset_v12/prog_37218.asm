; DESCRIPTION: Composite: Places a red 92x85 rectangle at position (130, 31) then Renders a orange line between points (122, 60) and (357, 59).
; PLAN: r0=130(x), r1=31(y), r2=92(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=122(x1), r6=60(y1), r7=357(x2), r8=59(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 130
LDI r1, 31
LDI r2, 92
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 122
LDI r6, 60
LDI r7, 357
LDI r8, 59
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
