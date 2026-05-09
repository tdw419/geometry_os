; DESCRIPTION: Renders a cyan line between points (491, 80) and (213, 229).
; PLAN: r0=491(x1), r1=80(y1), r2=213(x2), r3=229(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 80
LDI r2, 213
LDI r3, 229
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
