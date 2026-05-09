; DESCRIPTION: Renders a white line between points (198, 27) and (24, 21).
; PLAN: r0=198(x1), r1=27(y1), r2=24(x2), r3=21(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 27
LDI r2, 24
LDI r3, 21
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
