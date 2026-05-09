; DESCRIPTION: Composite: . Then Draws a magenta rectangle at (91, 61) with width 80 and height 97. Then Renders a green line between points (34, 194) and (124, 243).
; PLAN: r0=91(x), r1=61(y), r2=80(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=34(x1), r1=194(y1), r2=124(x2), r3=243(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta rectangle at (91, 61) with width 80 and height 97.
; PLAN: r0=91(x), r1=61(y), r2=80(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 61
LDI r2, 80
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a green line between points (34, 194) and (124, 243).
; PLAN: r0=34(x1), r1=194(y1), r2=124(x2), r3=243(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 194
LDI r2, 124
LDI r3, 243
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
