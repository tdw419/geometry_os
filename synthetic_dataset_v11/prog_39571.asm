; DESCRIPTION: Draws a cyan line from (26, 121) to (182, 64).
; PLAN: r0=26(x1), r1=121(y1), r2=182(x2), r3=64(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 121
LDI r2, 182
LDI r3, 64
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
