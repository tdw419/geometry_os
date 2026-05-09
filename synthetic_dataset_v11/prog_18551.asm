; DESCRIPTION: Renders a red line between points (67, 195) and (168, 81).
; PLAN: r0=67(x1), r1=195(y1), r2=168(x2), r3=81(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 195
LDI r2, 168
LDI r3, 81
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
