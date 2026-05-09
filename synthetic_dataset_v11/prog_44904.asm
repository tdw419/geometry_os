; DESCRIPTION: Renders a cyan line between points (206, 219) and (35, 19).
; PLAN: r0=206(x1), r1=219(y1), r2=35(x2), r3=19(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 219
LDI r2, 35
LDI r3, 19
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
