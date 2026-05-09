; DESCRIPTION: Composite: . Then Draws a green line from (114, 226) to (7, 210). Then Renders a blue box of size 31x42 starting at (45, 23).
; PLAN: r0=114(x1), r1=226(y1), r2=7(x2), r3=210(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=45(x), r1=23(y), r2=31(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green line from (114, 226) to (7, 210).
; PLAN: r0=114(x1), r1=226(y1), r2=7(x2), r3=210(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 226
LDI r2, 7
LDI r3, 210
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a blue box of size 31x42 starting at (45, 23).
; PLAN: r0=45(x), r1=23(y), r2=31(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 23
LDI r2, 31
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
