; DESCRIPTION: Renders a purple line between points (166, 67) and (215, 146).
; PLAN: r0=166(x1), r1=67(y1), r2=215(x2), r3=146(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 67
LDI r2, 215
LDI r3, 146
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
