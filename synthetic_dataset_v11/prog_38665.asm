; DESCRIPTION: Draws a cyan line from (61, 62) to (160, 46).
; PLAN: r0=61(x1), r1=62(y1), r2=160(x2), r3=46(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 62
LDI r2, 160
LDI r3, 46
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
