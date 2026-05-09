; DESCRIPTION: Draws a cyan line from (165, 28) to (35, 230).
; PLAN: r0=165(x1), r1=28(y1), r2=35(x2), r3=230(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 28
LDI r2, 35
LDI r3, 230
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
