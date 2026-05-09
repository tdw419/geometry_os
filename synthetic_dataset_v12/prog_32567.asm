; DESCRIPTION: Renders a purple line between points (487, 234) and (299, 171).
; PLAN: r0=487(x1), r1=234(y1), r2=299(x2), r3=171(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 234
LDI r2, 299
LDI r3, 171
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
