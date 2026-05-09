; DESCRIPTION: Draws a green line from (112, 124) to (68, 29).
; PLAN: r0=112(x1), r1=124(y1), r2=68(x2), r3=29(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 124
LDI r2, 68
LDI r3, 29
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
