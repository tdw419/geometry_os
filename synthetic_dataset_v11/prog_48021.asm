; DESCRIPTION: Draws a cyan line from (123, 131) to (71, 40).
; PLAN: r0=123(x1), r1=131(y1), r2=71(x2), r3=40(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 131
LDI r2, 71
LDI r3, 40
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
