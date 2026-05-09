; DESCRIPTION: Renders a blue line between points (401, 93) and (213, 238).
; PLAN: r0=401(x1), r1=93(y1), r2=213(x2), r3=238(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 93
LDI r2, 213
LDI r3, 238
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
