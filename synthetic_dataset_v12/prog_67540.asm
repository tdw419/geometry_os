; DESCRIPTION: Renders a cyan line between points (292, 124) and (388, 57).
; PLAN: r0=292(x1), r1=124(y1), r2=388(x2), r3=57(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 124
LDI r2, 388
LDI r3, 57
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
