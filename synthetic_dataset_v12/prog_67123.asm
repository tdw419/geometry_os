; DESCRIPTION: Draws a cyan line from (387, 123) to (114, 19).
; PLAN: r0=387(x1), r1=123(y1), r2=114(x2), r3=19(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 123
LDI r2, 114
LDI r3, 19
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
