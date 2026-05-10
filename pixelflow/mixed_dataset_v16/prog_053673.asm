; DESCRIPTION: Renders a white line between points (492, 31) and (446, 99).
; PLAN: r0=492(x1), r1=31(y1), r2=446(x2), r3=99(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 31
LDI r2, 446
LDI r3, 99
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
