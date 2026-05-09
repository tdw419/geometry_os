; DESCRIPTION: Composite: . Then Draws a orange line from (85, 146) to (33, 12). Then Draws a cyan rectangle at (93, 33) with width 75 and height 115.
; PLAN: r0=85(x1), r1=146(y1), r2=33(x2), r3=12(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=93(x), r1=33(y), r2=75(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange line from (85, 146) to (33, 12).
; PLAN: r0=85(x1), r1=146(y1), r2=33(x2), r3=12(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 146
LDI r2, 33
LDI r3, 12
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a cyan rectangle at (93, 33) with width 75 and height 115.
; PLAN: r0=93(x), r1=33(y), r2=75(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 33
LDI r2, 75
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
