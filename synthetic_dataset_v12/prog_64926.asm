; DESCRIPTION: Draws a cyan line from (503, 48) to (456, 24).
; PLAN: r0=503(x1), r1=48(y1), r2=456(x2), r3=24(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 48
LDI r2, 456
LDI r3, 24
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
