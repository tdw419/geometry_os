; DESCRIPTION: Renders a green box of size 58x15 starting at (389, 93).
; PLAN: r0=389(x), r1=93(y), r2=58(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 93
LDI r2, 58
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
