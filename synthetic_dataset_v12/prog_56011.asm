; DESCRIPTION: Renders a green line between points (459, 5) and (502, 243).
; PLAN: r0=459(x1), r1=5(y1), r2=502(x2), r3=243(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 5
LDI r2, 502
LDI r3, 243
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
