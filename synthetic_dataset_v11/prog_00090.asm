; DESCRIPTION: Composite: . Then Renders a blue line between points (88, 101) and (59, 245). Then Places a red dot at position (68, 42).
; PLAN: r0=88(x1), r1=101(y1), r2=59(x2), r3=245(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=68(x), r1=42(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue line between points (88, 101) and (59, 245).
; PLAN: r0=88(x1), r1=101(y1), r2=59(x2), r3=245(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 101
LDI r2, 59
LDI r3, 245
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (68, 42).
; PLAN: r0=68(x), r1=42(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 68
LDI r1, 42
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
