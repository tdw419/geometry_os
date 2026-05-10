; DESCRIPTION: Draws a blue line from (365, 34) to (154, 14).
; PLAN: r0=365(x1), r1=34(y1), r2=154(x2), r3=14(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 34
LDI r2, 154
LDI r3, 14
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
