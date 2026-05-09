; DESCRIPTION: Composite: . Then Places a blue 21x13 rectangle at position (105, 196). Then Places a magenta line segment connecting (37, 226) to (60, 27).
; PLAN: r0=105(x), r1=196(y), r2=21(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=37(x1), r1=226(y1), r2=60(x2), r3=27(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue 21x13 rectangle at position (105, 196).
; PLAN: r0=105(x), r1=196(y), r2=21(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 196
LDI r2, 21
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta line segment connecting (37, 226) to (60, 27).
; PLAN: r0=37(x1), r1=226(y1), r2=60(x2), r3=27(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 226
LDI r2, 60
LDI r3, 27
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
