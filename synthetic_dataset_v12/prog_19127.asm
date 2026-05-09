; DESCRIPTION: Draws a cyan line from (2, 73) to (226, 144).
; PLAN: r0=2(x1), r1=73(y1), r2=226(x2), r3=144(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 73
LDI r2, 226
LDI r3, 144
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
