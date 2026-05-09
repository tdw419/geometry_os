; DESCRIPTION: Draws a cyan line from (131, 226) to (43, 55).
; PLAN: r0=131(x1), r1=226(y1), r2=43(x2), r3=55(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 226
LDI r2, 43
LDI r3, 55
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
