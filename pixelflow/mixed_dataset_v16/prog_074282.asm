; DESCRIPTION: Draws a green line from (434, 179) to (123, 234).
; PLAN: r0=434(x1), r1=179(y1), r2=123(x2), r3=234(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 179
LDI r2, 123
LDI r3, 234
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
