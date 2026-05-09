; DESCRIPTION: Draws a cyan line from (165, 76) to (107, 92).
; PLAN: r0=165(x1), r1=76(y1), r2=107(x2), r3=92(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 76
LDI r2, 107
LDI r3, 92
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
