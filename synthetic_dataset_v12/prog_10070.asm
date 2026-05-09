; DESCRIPTION: Renders a green line between points (96, 61) and (39, 134).
; PLAN: r0=96(x1), r1=61(y1), r2=39(x2), r3=134(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 61
LDI r2, 39
LDI r3, 134
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
