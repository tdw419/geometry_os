; DESCRIPTION: Renders a white line between points (481, 70) and (267, 12).
; PLAN: r0=481(x1), r1=70(y1), r2=267(x2), r3=12(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 70
LDI r2, 267
LDI r3, 12
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
