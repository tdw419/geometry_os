; DESCRIPTION: Draws a cyan line from (81, 160) to (29, 48).
; PLAN: r0=81(x1), r1=160(y1), r2=29(x2), r3=48(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 160
LDI r2, 29
LDI r3, 48
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
