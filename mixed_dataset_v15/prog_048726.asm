; DESCRIPTION: Renders a white line between points (481, 44) and (426, 240).
; PLAN: r0=481(x1), r1=44(y1), r2=426(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 44
LDI r2, 426
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
