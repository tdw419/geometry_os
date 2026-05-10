; DESCRIPTION: Renders a orange line segment connecting (82, 48) to (168, 151).
; PLAN: r0=82(x1), r1=48(y1), r2=168(x2), r3=151(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 48
LDI r2, 168
LDI r3, 151
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
