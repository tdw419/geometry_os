; DESCRIPTION: Renders a cyan line between points (47, 185) and (352, 219).
; PLAN: r0=47(x1), r1=185(y1), r2=352(x2), r3=219(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 185
LDI r2, 352
LDI r3, 219
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
