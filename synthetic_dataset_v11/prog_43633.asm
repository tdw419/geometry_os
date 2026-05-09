; DESCRIPTION: Renders a cyan line between points (73, 7) and (38, 234).
; PLAN: r0=73(x1), r1=7(y1), r2=38(x2), r3=234(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 7
LDI r2, 38
LDI r3, 234
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
