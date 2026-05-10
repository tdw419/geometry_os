; DESCRIPTION: Renders a cyan line segment connecting (399, 120) to (81, 103).
; PLAN: r0=399(x1), r1=120(y1), r2=81(x2), r3=103(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 120
LDI r2, 81
LDI r3, 103
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
