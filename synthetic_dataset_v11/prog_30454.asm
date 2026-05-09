; DESCRIPTION: Renders a white line between points (209, 90) and (27, 63).
; PLAN: r0=209(x1), r1=90(y1), r2=27(x2), r3=63(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 90
LDI r2, 27
LDI r3, 63
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
