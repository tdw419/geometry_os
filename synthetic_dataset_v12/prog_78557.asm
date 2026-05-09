; DESCRIPTION: Places a cyan line segment connecting (458, 168) to (480, 185).
; PLAN: r0=458(x1), r1=168(y1), r2=480(x2), r3=185(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 168
LDI r2, 480
LDI r3, 185
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
