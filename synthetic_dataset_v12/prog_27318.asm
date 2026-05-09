; DESCRIPTION: Renders a green line between points (445, 3) and (250, 82).
; PLAN: r0=445(x1), r1=3(y1), r2=250(x2), r3=82(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 3
LDI r2, 250
LDI r3, 82
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
