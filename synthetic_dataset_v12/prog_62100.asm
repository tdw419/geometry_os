; DESCRIPTION: Draws a cyan line from (447, 95) to (385, 142).
; PLAN: r0=447(x1), r1=95(y1), r2=385(x2), r3=142(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 95
LDI r2, 385
LDI r3, 142
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
