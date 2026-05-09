; DESCRIPTION: Renders a yellow line between points (481, 178) and (482, 57).
; PLAN: r0=481(x1), r1=178(y1), r2=482(x2), r3=57(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 178
LDI r2, 482
LDI r3, 57
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
