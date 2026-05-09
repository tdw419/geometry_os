; DESCRIPTION: Composite: Places a orange 53x90 rectangle at position (41, 94) then Renders a red line between points (63, 123) and (146, 65).
; PLAN: r0=41(x), r1=94(y), r2=53(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=63(x1), r6=123(y1), r7=146(x2), r8=65(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 41
LDI r1, 94
LDI r2, 53
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 123
LDI r7, 146
LDI r8, 65
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
