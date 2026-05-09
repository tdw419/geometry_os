; DESCRIPTION: Draws a cyan line from (160, 164) to (121, 227).
; PLAN: r0=160(x1), r1=164(y1), r2=121(x2), r3=227(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 164
LDI r2, 121
LDI r3, 227
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
