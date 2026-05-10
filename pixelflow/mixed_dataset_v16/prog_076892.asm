; DESCRIPTION: Draws a cyan line from (398, 137) to (234, 29).
; PLAN: r0=398(x1), r1=137(y1), r2=234(x2), r3=29(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 137
LDI r2, 234
LDI r3, 29
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
