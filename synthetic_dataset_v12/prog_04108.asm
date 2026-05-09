; DESCRIPTION: Draws a blue line from (143, 205) to (380, 16).
; PLAN: r0=143(x1), r1=205(y1), r2=380(x2), r3=16(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 205
LDI r2, 380
LDI r3, 16
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
