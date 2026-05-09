; DESCRIPTION: Composite: . Then Places a blue line segment connecting (193, 121) to (88, 27). Then Places a green 95x16 rectangle at position (8, 127).
; PLAN: r0=193(x1), r1=121(y1), r2=88(x2), r3=27(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=8(x), r1=127(y), r2=95(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue line segment connecting (193, 121) to (88, 27).
; PLAN: r0=193(x1), r1=121(y1), r2=88(x2), r3=27(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 121
LDI r2, 88
LDI r3, 27
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green 95x16 rectangle at position (8, 127).
; PLAN: r0=8(x), r1=127(y), r2=95(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 127
LDI r2, 95
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
