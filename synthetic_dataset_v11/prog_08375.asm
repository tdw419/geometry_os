; DESCRIPTION: Draws a cyan line from (54, 164) to (234, 199).
; PLAN: r0=54(x1), r1=164(y1), r2=234(x2), r3=199(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 164
LDI r2, 234
LDI r3, 199
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
