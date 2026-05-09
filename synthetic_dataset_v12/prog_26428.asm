; DESCRIPTION: Draws a white line from (59, 192) to (326, 167).
; PLAN: r0=59(x1), r1=192(y1), r2=326(x2), r3=167(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 192
LDI r2, 326
LDI r3, 167
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
