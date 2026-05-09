; DESCRIPTION: Composite: . Then Places a blue 92x61 rectangle at position (139, 86). Then Places a green line segment connecting (145, 1) to (215, 127).
; PLAN: r0=139(x), r1=86(y), r2=92(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=145(x1), r1=1(y1), r2=215(x2), r3=127(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue 92x61 rectangle at position (139, 86).
; PLAN: r0=139(x), r1=86(y), r2=92(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 86
LDI r2, 92
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a green line segment connecting (145, 1) to (215, 127).
; PLAN: r0=145(x1), r1=1(y1), r2=215(x2), r3=127(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 1
LDI r2, 215
LDI r3, 127
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
