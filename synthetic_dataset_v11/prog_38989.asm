; DESCRIPTION: Composite: . Then Renders a cyan box of size 45x93 starting at (13, 33). Then Renders a blue line between points (170, 249) and (244, 13).
; PLAN: r0=13(x), r1=33(y), r2=45(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=170(x1), r1=249(y1), r2=244(x2), r3=13(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan box of size 45x93 starting at (13, 33).
; PLAN: r0=13(x), r1=33(y), r2=45(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 33
LDI r2, 45
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a blue line between points (170, 249) and (244, 13).
; PLAN: r0=170(x1), r1=249(y1), r2=244(x2), r3=13(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 249
LDI r2, 244
LDI r3, 13
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
