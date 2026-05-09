; DESCRIPTION: Draws a cyan line from (210, 81) to (120, 96).
; PLAN: r0=210(x1), r1=81(y1), r2=120(x2), r3=96(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 81
LDI r2, 120
LDI r3, 96
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
