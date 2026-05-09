; DESCRIPTION: Renders a cyan line between points (218, 20) and (217, 10).
; PLAN: r0=218(x1), r1=20(y1), r2=217(x2), r3=10(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 20
LDI r2, 217
LDI r3, 10
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
