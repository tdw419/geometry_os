; DESCRIPTION: Composite: Creates a orange rectangular region at (471, 13) spanning 28 by 60 pixels then Renders a cyan line between points (399, 20) and (79, 117).
; PLAN: r0=471(x), r1=13(y), r2=28(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=399(x1), r6=20(y1), r7=79(x2), r8=117(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 471
LDI r1, 13
LDI r2, 28
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 399
LDI r6, 20
LDI r7, 79
LDI r8, 117
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
