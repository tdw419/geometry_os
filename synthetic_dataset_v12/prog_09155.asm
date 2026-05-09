; DESCRIPTION: Renders a green line between points (25, 166) and (61, 134).
; PLAN: r0=25(x1), r1=166(y1), r2=61(x2), r3=134(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 166
LDI r2, 61
LDI r3, 134
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
