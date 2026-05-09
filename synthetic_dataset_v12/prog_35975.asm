; DESCRIPTION: Places a orange line segment connecting (487, 237) to (401, 197).
; PLAN: r0=487(x1), r1=237(y1), r2=401(x2), r3=197(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 237
LDI r2, 401
LDI r3, 197
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
