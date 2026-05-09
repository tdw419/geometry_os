; DESCRIPTION: Renders a cyan line between points (218, 25) and (81, 144).
; PLAN: r0=218(x1), r1=25(y1), r2=81(x2), r3=144(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 25
LDI r2, 81
LDI r3, 144
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
