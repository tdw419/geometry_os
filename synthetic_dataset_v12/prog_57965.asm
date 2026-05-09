; DESCRIPTION: Draws a cyan line from (99, 141) to (184, 237).
; PLAN: r0=99(x1), r1=141(y1), r2=184(x2), r3=237(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 141
LDI r2, 184
LDI r3, 237
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
