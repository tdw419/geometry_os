; DESCRIPTION: Places a cyan line segment connecting (193, 115) to (176, 190).
; PLAN: r0=193(x1), r1=115(y1), r2=176(x2), r3=190(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 115
LDI r2, 176
LDI r3, 190
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
