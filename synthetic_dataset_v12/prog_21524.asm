; DESCRIPTION: Renders a green line between points (485, 125) and (502, 54).
; PLAN: r0=485(x1), r1=125(y1), r2=502(x2), r3=54(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 125
LDI r2, 502
LDI r3, 54
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
