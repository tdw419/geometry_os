; DESCRIPTION: Composite: . Then Places a yellow 17x61 rectangle at position (114, 36). Then Draws a purple line from (209, 166) to (195, 86).
; PLAN: r0=114(x), r1=36(y), r2=17(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=209(x1), r1=166(y1), r2=195(x2), r3=86(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow 17x61 rectangle at position (114, 36).
; PLAN: r0=114(x), r1=36(y), r2=17(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 36
LDI r2, 17
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple line from (209, 166) to (195, 86).
; PLAN: r0=209(x1), r1=166(y1), r2=195(x2), r3=86(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 166
LDI r2, 195
LDI r3, 86
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
