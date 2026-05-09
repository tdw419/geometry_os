; DESCRIPTION: Draws a green line from (47, 38) to (32, 173).
; PLAN: r0=47(x1), r1=38(y1), r2=32(x2), r3=173(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 38
LDI r2, 32
LDI r3, 173
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
