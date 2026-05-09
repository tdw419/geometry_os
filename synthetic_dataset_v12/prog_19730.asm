; DESCRIPTION: Draws a cyan line from (123, 216) to (22, 182).
; PLAN: r0=123(x1), r1=216(y1), r2=22(x2), r3=182(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 216
LDI r2, 22
LDI r3, 182
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
