; DESCRIPTION: Composite: . Then Places a yellow 14x28 rectangle at position (109, 197). Then Places a magenta line segment connecting (45, 127) to (23, 98).
; PLAN: r0=109(x), r1=197(y), r2=14(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=45(x1), r1=127(y1), r2=23(x2), r3=98(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow 14x28 rectangle at position (109, 197).
; PLAN: r0=109(x), r1=197(y), r2=14(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 197
LDI r2, 14
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta line segment connecting (45, 127) to (23, 98).
; PLAN: r0=45(x1), r1=127(y1), r2=23(x2), r3=98(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 127
LDI r2, 23
LDI r3, 98
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
