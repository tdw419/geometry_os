; DESCRIPTION: Draws a cyan line from (101, 202) to (447, 144).
; PLAN: r0=101(x1), r1=202(y1), r2=447(x2), r3=144(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 202
LDI r2, 447
LDI r3, 144
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
