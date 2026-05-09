; DESCRIPTION: Draws a cyan line from (398, 80) to (227, 46).
; PLAN: r0=398(x1), r1=80(y1), r2=227(x2), r3=46(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 80
LDI r2, 227
LDI r3, 46
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
