; DESCRIPTION: Draws a white line from (256, 188) to (57, 28).
; PLAN: r0=256(x1), r1=188(y1), r2=57(x2), r3=28(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 188
LDI r2, 57
LDI r3, 28
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
