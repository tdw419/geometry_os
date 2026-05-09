; DESCRIPTION: Draws a yellow line from (420, 16) to (393, 32).
; PLAN: r0=420(x1), r1=16(y1), r2=393(x2), r3=32(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 16
LDI r2, 393
LDI r3, 32
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
