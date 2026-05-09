; DESCRIPTION: Renders a white line between points (32, 152) and (485, 168).
; PLAN: r0=32(x1), r1=152(y1), r2=485(x2), r3=168(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 152
LDI r2, 485
LDI r3, 168
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
