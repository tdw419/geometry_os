; DESCRIPTION: Renders a white line between points (275, 22) and (218, 125).
; PLAN: r0=275(x1), r1=22(y1), r2=218(x2), r3=125(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 22
LDI r2, 218
LDI r3, 125
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
