; DESCRIPTION: Renders a cyan line between points (387, 129) and (169, 218).
; PLAN: r0=387(x1), r1=129(y1), r2=169(x2), r3=218(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 129
LDI r2, 169
LDI r3, 218
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
