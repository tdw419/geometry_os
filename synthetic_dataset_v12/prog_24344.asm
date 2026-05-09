; DESCRIPTION: Renders a white line between points (152, 24) and (245, 125).
; PLAN: r0=152(x1), r1=24(y1), r2=245(x2), r3=125(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 24
LDI r2, 245
LDI r3, 125
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
