; DESCRIPTION: Composite: . Then Draws a green line from (97, 174) to (94, 89). Then Places a red 62x15 rectangle at position (144, 102).
; PLAN: r0=97(x1), r1=174(y1), r2=94(x2), r3=89(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=144(x), r1=102(y), r2=62(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green line from (97, 174) to (94, 89).
; PLAN: r0=97(x1), r1=174(y1), r2=94(x2), r3=89(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 174
LDI r2, 94
LDI r3, 89
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red 62x15 rectangle at position (144, 102).
; PLAN: r0=144(x), r1=102(y), r2=62(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 102
LDI r2, 62
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
