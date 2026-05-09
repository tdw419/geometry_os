; DESCRIPTION: Renders a cyan line between points (28, 161) and (486, 38).
; PLAN: r0=28(x1), r1=161(y1), r2=486(x2), r3=38(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 161
LDI r2, 486
LDI r3, 38
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
