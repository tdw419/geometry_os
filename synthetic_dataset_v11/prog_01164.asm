; DESCRIPTION: Composite: . Then Places a magenta line segment connecting (213, 26) to (232, 58). Then Renders a cyan box of size 113x41 starting at (93, 96).
; PLAN: r0=213(x1), r1=26(y1), r2=232(x2), r3=58(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=93(x), r1=96(y), r2=113(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta line segment connecting (213, 26) to (232, 58).
; PLAN: r0=213(x1), r1=26(y1), r2=232(x2), r3=58(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 26
LDI r2, 232
LDI r3, 58
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan box of size 113x41 starting at (93, 96).
; PLAN: r0=93(x), r1=96(y), r2=113(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 96
LDI r2, 113
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
