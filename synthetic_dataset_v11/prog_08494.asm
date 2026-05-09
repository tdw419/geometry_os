; DESCRIPTION: Draws a white line from (208, 29) to (218, 96).
; PLAN: r0=208(x1), r1=29(y1), r2=218(x2), r3=96(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 29
LDI r2, 218
LDI r3, 96
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
