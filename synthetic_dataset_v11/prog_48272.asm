; DESCRIPTION: Composite: . Then Renders a red line between points (1, 2) and (150, 186). Then Renders a yellow box of size 88x31 starting at (23, 71).
; PLAN: r0=1(x1), r1=2(y1), r2=150(x2), r3=186(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=23(x), r1=71(y), r2=88(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a red line between points (1, 2) and (150, 186).
; PLAN: r0=1(x1), r1=2(y1), r2=150(x2), r3=186(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 2
LDI r2, 150
LDI r3, 186
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow box of size 88x31 starting at (23, 71).
; PLAN: r0=23(x), r1=71(y), r2=88(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 71
LDI r2, 88
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
