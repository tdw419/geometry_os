; DESCRIPTION: Renders a cyan line between points (177, 83) and (32, 120).
; PLAN: r0=177(x1), r1=83(y1), r2=32(x2), r3=120(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 83
LDI r2, 32
LDI r3, 120
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
