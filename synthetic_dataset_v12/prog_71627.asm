; DESCRIPTION: Draws a cyan line from (148, 238) to (475, 178).
; PLAN: r0=148(x1), r1=238(y1), r2=475(x2), r3=178(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 238
LDI r2, 475
LDI r3, 178
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
