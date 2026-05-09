; DESCRIPTION: Renders a white line between points (283, 149) and (401, 153).
; PLAN: r0=283(x1), r1=149(y1), r2=401(x2), r3=153(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 149
LDI r2, 401
LDI r3, 153
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
