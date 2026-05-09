; DESCRIPTION: Renders a cyan line between points (58, 191) and (48, 80).
; PLAN: r0=58(x1), r1=191(y1), r2=48(x2), r3=80(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 191
LDI r2, 48
LDI r3, 80
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
