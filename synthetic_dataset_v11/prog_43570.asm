; DESCRIPTION: Draws a cyan line from (179, 82) to (162, 214).
; PLAN: r0=179(x1), r1=82(y1), r2=162(x2), r3=214(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 82
LDI r2, 162
LDI r3, 214
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
