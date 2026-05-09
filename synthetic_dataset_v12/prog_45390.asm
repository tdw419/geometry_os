; DESCRIPTION: Draws a cyan line from (110, 221) to (254, 44).
; PLAN: r0=110(x1), r1=221(y1), r2=254(x2), r3=44(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 221
LDI r2, 254
LDI r3, 44
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
