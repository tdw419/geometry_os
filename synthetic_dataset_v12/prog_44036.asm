; DESCRIPTION: Renders a white line between points (458, 213) and (356, 108).
; PLAN: r0=458(x1), r1=213(y1), r2=356(x2), r3=108(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 213
LDI r2, 356
LDI r3, 108
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
