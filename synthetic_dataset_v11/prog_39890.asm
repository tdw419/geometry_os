; DESCRIPTION: Composite: . Then Draws a red line from (41, 89) to (126, 66). Then Creates a green rectangular region at (52, 8) spanning 58 by 38 pixels.
; PLAN: r0=41(x1), r1=89(y1), r2=126(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=52(x), r1=8(y), r2=58(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red line from (41, 89) to (126, 66).
; PLAN: r0=41(x1), r1=89(y1), r2=126(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 89
LDI r2, 126
LDI r3, 66
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a green rectangular region at (52, 8) spanning 58 by 38 pixels.
; PLAN: r0=52(x), r1=8(y), r2=58(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 8
LDI r2, 58
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
