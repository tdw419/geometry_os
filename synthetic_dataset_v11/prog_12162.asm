; DESCRIPTION: Composite: . Then Places a green line segment connecting (97, 49) to (210, 163). Then Renders a cyan box of size 80x54 starting at (86, 10).
; PLAN: r0=97(x1), r1=49(y1), r2=210(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=86(x), r1=10(y), r2=80(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green line segment connecting (97, 49) to (210, 163).
; PLAN: r0=97(x1), r1=49(y1), r2=210(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 49
LDI r2, 210
LDI r3, 163
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan box of size 80x54 starting at (86, 10).
; PLAN: r0=86(x), r1=10(y), r2=80(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 10
LDI r2, 80
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
