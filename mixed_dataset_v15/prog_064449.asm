; DESCRIPTION: Draws a white line from (217, 190) to (178, 16).
; PLAN: r0=217(x1), r1=190(y1), r2=178(x2), r3=16(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 190
LDI r2, 178
LDI r3, 16
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
