; DESCRIPTION: Composite: . Then Places a blue line segment connecting (160, 103) to (209, 161). Then Places a green 99x69 rectangle at position (108, 129).
; PLAN: r0=160(x1), r1=103(y1), r2=209(x2), r3=161(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=108(x), r1=129(y), r2=99(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue line segment connecting (160, 103) to (209, 161).
; PLAN: r0=160(x1), r1=103(y1), r2=209(x2), r3=161(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 103
LDI r2, 209
LDI r3, 161
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green 99x69 rectangle at position (108, 129).
; PLAN: r0=108(x), r1=129(y), r2=99(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 129
LDI r2, 99
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
