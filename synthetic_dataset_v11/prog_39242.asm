; DESCRIPTION: Renders a green line between points (30, 151) and (215, 20).
; PLAN: r0=30(x1), r1=151(y1), r2=215(x2), r3=20(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 151
LDI r2, 215
LDI r3, 20
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
