; DESCRIPTION: Renders a white line between points (282, 124) and (173, 229).
; PLAN: r0=282(x1), r1=124(y1), r2=173(x2), r3=229(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 124
LDI r2, 173
LDI r3, 229
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
