; DESCRIPTION: Renders a cyan line between points (198, 7) and (238, 52).
; PLAN: r0=198(x1), r1=7(y1), r2=238(x2), r3=52(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 7
LDI r2, 238
LDI r3, 52
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
