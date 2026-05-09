; DESCRIPTION: Composite: . Then Places a red 58x65 rectangle at position (94, 63). Then Places a yellow line segment connecting (121, 138) to (145, 211).
; PLAN: r0=94(x), r1=63(y), r2=58(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=121(x1), r1=138(y1), r2=145(x2), r3=211(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red 58x65 rectangle at position (94, 63).
; PLAN: r0=94(x), r1=63(y), r2=58(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 63
LDI r2, 58
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow line segment connecting (121, 138) to (145, 211).
; PLAN: r0=121(x1), r1=138(y1), r2=145(x2), r3=211(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 138
LDI r2, 145
LDI r3, 211
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
