; DESCRIPTION: Draws a white line from (294, 115) to (270, 178).
; PLAN: r0=294(x1), r1=115(y1), r2=270(x2), r3=178(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 115
LDI r2, 270
LDI r3, 178
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
