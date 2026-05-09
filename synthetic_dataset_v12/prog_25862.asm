; DESCRIPTION: Renders a cyan line between points (22, 59) and (217, 234).
; PLAN: r0=22(x1), r1=59(y1), r2=217(x2), r3=234(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 59
LDI r2, 217
LDI r3, 234
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
