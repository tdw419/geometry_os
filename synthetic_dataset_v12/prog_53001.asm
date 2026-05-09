; DESCRIPTION: Places a green line segment connecting (157, 93) to (387, 190).
; PLAN: r0=157(x1), r1=93(y1), r2=387(x2), r3=190(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 93
LDI r2, 387
LDI r3, 190
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
