; DESCRIPTION: Draws a cyan line from (491, 0) to (123, 175).
; PLAN: r0=491(x1), r1=0(y1), r2=123(x2), r3=175(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 0
LDI r2, 123
LDI r3, 175
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
