; DESCRIPTION: Renders a yellow line between points (292, 168) and (446, 171).
; PLAN: r0=292(x1), r1=168(y1), r2=446(x2), r3=171(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 168
LDI r2, 446
LDI r3, 171
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
