; DESCRIPTION: Renders a cyan line between points (241, 66) and (237, 202).
; PLAN: r0=241(x1), r1=66(y1), r2=237(x2), r3=202(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 66
LDI r2, 237
LDI r3, 202
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
