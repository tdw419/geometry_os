; DESCRIPTION: Draws a cyan line from (40, 210) to (123, 78).
; PLAN: r0=40(x1), r1=210(y1), r2=123(x2), r3=78(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 210
LDI r2, 123
LDI r3, 78
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
