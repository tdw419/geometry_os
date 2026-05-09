; DESCRIPTION: Renders a blue line between points (445, 108) and (275, 29).
; PLAN: r0=445(x1), r1=108(y1), r2=275(x2), r3=29(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 108
LDI r2, 275
LDI r3, 29
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
