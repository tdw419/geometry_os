; DESCRIPTION: Renders a white line between points (437, 64) and (383, 242).
; PLAN: r0=437(x1), r1=64(y1), r2=383(x2), r3=242(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 64
LDI r2, 383
LDI r3, 242
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
