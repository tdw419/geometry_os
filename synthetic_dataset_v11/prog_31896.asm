; DESCRIPTION: Composite: . Then Renders a blue line between points (157, 34) and (191, 247). Then Renders a cyan box of size 66x112 starting at (18, 101).
; PLAN: r0=157(x1), r1=34(y1), r2=191(x2), r3=247(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=18(x), r1=101(y), r2=66(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue line between points (157, 34) and (191, 247).
; PLAN: r0=157(x1), r1=34(y1), r2=191(x2), r3=247(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 34
LDI r2, 191
LDI r3, 247
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan box of size 66x112 starting at (18, 101).
; PLAN: r0=18(x), r1=101(y), r2=66(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 101
LDI r2, 66
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
