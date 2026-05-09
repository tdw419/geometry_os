; DESCRIPTION: Renders a cyan line between points (425, 63) and (348, 208).
; PLAN: r0=425(x1), r1=63(y1), r2=348(x2), r3=208(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 63
LDI r2, 348
LDI r3, 208
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
