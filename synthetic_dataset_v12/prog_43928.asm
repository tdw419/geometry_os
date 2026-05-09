; DESCRIPTION: Draws a cyan line from (124, 226) to (10, 96).
; PLAN: r0=124(x1), r1=226(y1), r2=10(x2), r3=96(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 226
LDI r2, 10
LDI r3, 96
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
