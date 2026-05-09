; DESCRIPTION: Composite: . Then Places a blue 82x28 rectangle at position (163, 114). Then Draws a green line from (196, 188) to (151, 206).
; PLAN: r0=163(x), r1=114(y), r2=82(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=196(x1), r1=188(y1), r2=151(x2), r3=206(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue 82x28 rectangle at position (163, 114).
; PLAN: r0=163(x), r1=114(y), r2=82(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 114
LDI r2, 82
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green line from (196, 188) to (151, 206).
; PLAN: r0=196(x1), r1=188(y1), r2=151(x2), r3=206(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 188
LDI r2, 151
LDI r3, 206
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
