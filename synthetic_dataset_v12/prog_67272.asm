; DESCRIPTION: Draws a cyan line from (447, 43) to (81, 57).
; PLAN: r0=447(x1), r1=43(y1), r2=81(x2), r3=57(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 43
LDI r2, 81
LDI r3, 57
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
