; DESCRIPTION: Draws a cyan line from (179, 196) to (99, 233).
; PLAN: r0=179(x1), r1=196(y1), r2=99(x2), r3=233(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 196
LDI r2, 99
LDI r3, 233
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
