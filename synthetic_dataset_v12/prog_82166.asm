; DESCRIPTION: Renders a cyan line between points (206, 61) and (241, 90).
; PLAN: r0=206(x1), r1=61(y1), r2=241(x2), r3=90(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 61
LDI r2, 241
LDI r3, 90
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
