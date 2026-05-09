; DESCRIPTION: Draws a cyan line from (157, 53) to (202, 102).
; PLAN: r0=157(x1), r1=53(y1), r2=202(x2), r3=102(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 53
LDI r2, 202
LDI r3, 102
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
