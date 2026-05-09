; DESCRIPTION: Renders a cyan line between points (230, 64) and (3, 112).
; PLAN: r0=230(x1), r1=64(y1), r2=3(x2), r3=112(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 64
LDI r2, 3
LDI r3, 112
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
