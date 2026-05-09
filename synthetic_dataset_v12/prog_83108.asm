; DESCRIPTION: Renders a cyan line between points (423, 173) and (447, 9).
; PLAN: r0=423(x1), r1=173(y1), r2=447(x2), r3=9(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 173
LDI r2, 447
LDI r3, 9
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
