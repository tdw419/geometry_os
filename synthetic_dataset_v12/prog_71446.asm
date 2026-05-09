; DESCRIPTION: Renders a cyan line between points (315, 220) and (76, 168).
; PLAN: r0=315(x1), r1=220(y1), r2=76(x2), r3=168(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 220
LDI r2, 76
LDI r3, 168
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
