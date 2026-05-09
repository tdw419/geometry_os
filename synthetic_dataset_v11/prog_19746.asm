; DESCRIPTION: Renders a green line between points (67, 114) and (114, 182).
; PLAN: r0=67(x1), r1=114(y1), r2=114(x2), r3=182(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 114
LDI r2, 114
LDI r3, 182
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
