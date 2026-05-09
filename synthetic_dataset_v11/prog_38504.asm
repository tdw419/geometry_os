; DESCRIPTION: Renders a cyan line between points (251, 238) and (16, 242).
; PLAN: r0=251(x1), r1=238(y1), r2=16(x2), r3=242(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 238
LDI r2, 16
LDI r3, 242
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
