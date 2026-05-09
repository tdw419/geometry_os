; DESCRIPTION: Composite: . Then Places a purple line segment connecting (149, 59) to (135, 197). Then Renders a magenta box of size 61x111 starting at (124, 119).
; PLAN: r0=149(x1), r1=59(y1), r2=135(x2), r3=197(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=124(x), r1=119(y), r2=61(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple line segment connecting (149, 59) to (135, 197).
; PLAN: r0=149(x1), r1=59(y1), r2=135(x2), r3=197(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 59
LDI r2, 135
LDI r3, 197
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta box of size 61x111 starting at (124, 119).
; PLAN: r0=124(x), r1=119(y), r2=61(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 119
LDI r2, 61
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
