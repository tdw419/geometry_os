; DESCRIPTION: Renders a green line between points (121, 67) and (230, 98).
; PLAN: r0=121(x1), r1=67(y1), r2=230(x2), r3=98(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 67
LDI r2, 230
LDI r3, 98
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
