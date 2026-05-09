; DESCRIPTION: Composite: . Then Renders a blue line between points (192, 223) and (184, 216). Then Places a magenta 18x34 rectangle at position (54, 27).
; PLAN: r0=192(x1), r1=223(y1), r2=184(x2), r3=216(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=54(x), r1=27(y), r2=18(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue line between points (192, 223) and (184, 216).
; PLAN: r0=192(x1), r1=223(y1), r2=184(x2), r3=216(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 223
LDI r2, 184
LDI r3, 216
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta 18x34 rectangle at position (54, 27).
; PLAN: r0=54(x), r1=27(y), r2=18(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 27
LDI r2, 18
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
