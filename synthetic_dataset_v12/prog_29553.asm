; DESCRIPTION: Renders a cyan line between points (234, 28) and (458, 67).
; PLAN: r0=234(x1), r1=28(y1), r2=458(x2), r3=67(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 28
LDI r2, 458
LDI r3, 67
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
