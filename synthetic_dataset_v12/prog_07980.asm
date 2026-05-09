; DESCRIPTION: Draws a green line from (497, 242) to (439, 238).
; PLAN: r0=497(x1), r1=242(y1), r2=439(x2), r3=238(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 242
LDI r2, 439
LDI r3, 238
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
