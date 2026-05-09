; DESCRIPTION: Places a cyan line segment connecting (212, 238) to (458, 255).
; PLAN: r0=212(x1), r1=238(y1), r2=458(x2), r3=255(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 238
LDI r2, 458
LDI r3, 255
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
