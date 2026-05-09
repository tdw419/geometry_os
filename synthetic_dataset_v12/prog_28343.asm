; DESCRIPTION: Draws a cyan line from (54, 62) to (388, 225).
; PLAN: r0=54(x1), r1=62(y1), r2=388(x2), r3=225(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 62
LDI r2, 388
LDI r3, 225
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
