; DESCRIPTION: Renders a white line between points (493, 13) and (394, 161).
; PLAN: r0=493(x1), r1=13(y1), r2=394(x2), r3=161(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 13
LDI r2, 394
LDI r3, 161
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
