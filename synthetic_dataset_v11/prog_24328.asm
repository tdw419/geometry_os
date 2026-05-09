; DESCRIPTION: Renders a green line between points (108, 79) and (125, 174).
; PLAN: r0=108(x1), r1=79(y1), r2=125(x2), r3=174(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 79
LDI r2, 125
LDI r3, 174
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
