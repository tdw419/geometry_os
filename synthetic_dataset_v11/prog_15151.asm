; DESCRIPTION: Draws a cyan line from (238, 246) to (54, 236).
; PLAN: r0=238(x1), r1=246(y1), r2=54(x2), r3=236(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 246
LDI r2, 54
LDI r3, 236
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
