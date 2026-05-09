; DESCRIPTION: Draws a green line from (218, 61) to (48, 169).
; PLAN: r0=218(x1), r1=61(y1), r2=48(x2), r3=169(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 61
LDI r2, 48
LDI r3, 169
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
