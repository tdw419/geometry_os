; DESCRIPTION: Draws a cyan line from (53, 13) to (88, 153).
; PLAN: r0=53(x1), r1=13(y1), r2=88(x2), r3=153(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 13
LDI r2, 88
LDI r3, 153
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
