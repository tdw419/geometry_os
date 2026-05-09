; DESCRIPTION: Renders a white line between points (243, 6) and (61, 71).
; PLAN: r0=243(x1), r1=6(y1), r2=61(x2), r3=71(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 6
LDI r2, 61
LDI r3, 71
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
