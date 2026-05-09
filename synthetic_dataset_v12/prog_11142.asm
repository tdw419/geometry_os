; DESCRIPTION: Places a cyan line segment connecting (212, 93) to (107, 81).
; PLAN: r0=212(x1), r1=93(y1), r2=107(x2), r3=81(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 93
LDI r2, 107
LDI r3, 81
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
