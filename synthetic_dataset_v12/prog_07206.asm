; DESCRIPTION: Renders a cyan line between points (432, 53) and (120, 164).
; PLAN: r0=432(x1), r1=53(y1), r2=120(x2), r3=164(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 53
LDI r2, 120
LDI r3, 164
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
