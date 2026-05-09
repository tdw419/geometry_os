; DESCRIPTION: Composite: . Then Renders a black box of size 57x85 starting at (103, 153). Then Renders a orange line between points (212, 25) and (220, 178).
; PLAN: r0=103(x), r1=153(y), r2=57(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=212(x1), r1=25(y1), r2=220(x2), r3=178(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black box of size 57x85 starting at (103, 153).
; PLAN: r0=103(x), r1=153(y), r2=57(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 153
LDI r2, 57
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange line between points (212, 25) and (220, 178).
; PLAN: r0=212(x1), r1=25(y1), r2=220(x2), r3=178(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 25
LDI r2, 220
LDI r3, 178
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
