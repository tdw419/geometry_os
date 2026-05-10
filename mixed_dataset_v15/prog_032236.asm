; DESCRIPTION: Renders a black line between points (401, 18) and (487, 109).
; PLAN: r0=401(x1), r1=18(y1), r2=487(x2), r3=109(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 18
LDI r2, 487
LDI r3, 109
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
