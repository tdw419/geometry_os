; DESCRIPTION: Renders a white line between points (164, 27) and (7, 157).
; PLAN: r0=164(x1), r1=27(y1), r2=7(x2), r3=157(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 27
LDI r2, 7
LDI r3, 157
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
