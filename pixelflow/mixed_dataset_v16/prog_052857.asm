; DESCRIPTION: Draws a cyan line from (99, 181) to (103, 220).
; PLAN: r0=99(x1), r1=181(y1), r2=103(x2), r3=220(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 181
LDI r2, 103
LDI r3, 220
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
