; DESCRIPTION: Composite: . Then Renders a green line between points (47, 216) and (218, 220). Then Renders a magenta box of size 40x75 starting at (180, 24).
; PLAN: r0=47(x1), r1=216(y1), r2=218(x2), r3=220(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=180(x), r1=24(y), r2=40(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green line between points (47, 216) and (218, 220).
; PLAN: r0=47(x1), r1=216(y1), r2=218(x2), r3=220(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 216
LDI r2, 218
LDI r3, 220
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta box of size 40x75 starting at (180, 24).
; PLAN: r0=180(x), r1=24(y), r2=40(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 24
LDI r2, 40
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
