; DESCRIPTION: Renders a cyan line between points (16, 12) and (217, 238).
; PLAN: r0=16(x1), r1=12(y1), r2=217(x2), r3=238(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 12
LDI r2, 217
LDI r3, 238
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
