; DESCRIPTION: Draws a cyan line from (503, 131) to (31, 173).
; PLAN: r0=503(x1), r1=131(y1), r2=31(x2), r3=173(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 131
LDI r2, 31
LDI r3, 173
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
