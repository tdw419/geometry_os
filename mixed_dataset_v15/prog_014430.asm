; DESCRIPTION: Draws a cyan line from (217, 238) to (59, 58).
; PLAN: r0=217(x1), r1=238(y1), r2=59(x2), r3=58(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 238
LDI r2, 59
LDI r3, 58
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
