; DESCRIPTION: Draws a cyan line from (380, 14) to (266, 103).
; PLAN: r0=380(x1), r1=14(y1), r2=266(x2), r3=103(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 14
LDI r2, 266
LDI r3, 103
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
