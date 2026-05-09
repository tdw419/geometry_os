; DESCRIPTION: Draws a cyan line from (316, 8) to (506, 64).
; PLAN: r0=316(x1), r1=8(y1), r2=506(x2), r3=64(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 8
LDI r2, 506
LDI r3, 64
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
