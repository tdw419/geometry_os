; DESCRIPTION: Draws a cyan line from (455, 58) to (73, 82).
; PLAN: r0=455(x1), r1=58(y1), r2=73(x2), r3=82(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 58
LDI r2, 73
LDI r3, 82
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
