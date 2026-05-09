; DESCRIPTION: Places a red line segment connecting (231, 128) to (446, 93).
; PLAN: r0=231(x1), r1=128(y1), r2=446(x2), r3=93(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 128
LDI r2, 446
LDI r3, 93
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
