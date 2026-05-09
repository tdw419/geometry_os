; DESCRIPTION: Renders a white line between points (97, 63) and (280, 117).
; PLAN: r0=97(x1), r1=63(y1), r2=280(x2), r3=117(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 63
LDI r2, 280
LDI r3, 117
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
