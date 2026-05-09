; DESCRIPTION: Draws a cyan line from (475, 182) to (165, 220).
; PLAN: r0=475(x1), r1=182(y1), r2=165(x2), r3=220(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 182
LDI r2, 165
LDI r3, 220
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
