; DESCRIPTION: Composite: . Then Renders a yellow line between points (182, 143) and (243, 102). Then Places a magenta 37x78 rectangle at position (201, 89).
; PLAN: r0=182(x1), r1=143(y1), r2=243(x2), r3=102(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=201(x), r1=89(y), r2=37(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow line between points (182, 143) and (243, 102).
; PLAN: r0=182(x1), r1=143(y1), r2=243(x2), r3=102(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 143
LDI r2, 243
LDI r3, 102
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta 37x78 rectangle at position (201, 89).
; PLAN: r0=201(x), r1=89(y), r2=37(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 89
LDI r2, 37
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
