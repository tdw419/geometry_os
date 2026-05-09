; DESCRIPTION: Composite: . Then Renders a green line between points (154, 151) and (73, 179). Then Renders a green box of size 59x84 starting at (69, 6).
; PLAN: r0=154(x1), r1=151(y1), r2=73(x2), r3=179(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=69(x), r1=6(y), r2=59(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green line between points (154, 151) and (73, 179).
; PLAN: r0=154(x1), r1=151(y1), r2=73(x2), r3=179(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 151
LDI r2, 73
LDI r3, 179
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a green box of size 59x84 starting at (69, 6).
; PLAN: r0=69(x), r1=6(y), r2=59(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 6
LDI r2, 59
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
