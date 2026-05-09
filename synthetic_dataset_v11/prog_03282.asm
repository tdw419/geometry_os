; DESCRIPTION: Composite: . Then Draws a purple line from (243, 193) to (125, 160). Then Places a orange 99x72 rectangle at position (97, 74).
; PLAN: r0=243(x1), r1=193(y1), r2=125(x2), r3=160(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=97(x), r1=74(y), r2=99(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple line from (243, 193) to (125, 160).
; PLAN: r0=243(x1), r1=193(y1), r2=125(x2), r3=160(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 193
LDI r2, 125
LDI r3, 160
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange 99x72 rectangle at position (97, 74).
; PLAN: r0=97(x), r1=74(y), r2=99(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 74
LDI r2, 99
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
