; DESCRIPTION: Composite: . Then Renders a yellow line between points (145, 99) and (76, 157). Then Places a green 39x75 rectangle at position (44, 86).
; PLAN: r0=145(x1), r1=99(y1), r2=76(x2), r3=157(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=44(x), r1=86(y), r2=39(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow line between points (145, 99) and (76, 157).
; PLAN: r0=145(x1), r1=99(y1), r2=76(x2), r3=157(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 99
LDI r2, 76
LDI r3, 157
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green 39x75 rectangle at position (44, 86).
; PLAN: r0=44(x), r1=86(y), r2=39(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 86
LDI r2, 39
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
