; DESCRIPTION: Renders a white line between points (91, 5) and (499, 243).
; PLAN: r0=91(x1), r1=5(y1), r2=499(x2), r3=243(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 5
LDI r2, 499
LDI r3, 243
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
