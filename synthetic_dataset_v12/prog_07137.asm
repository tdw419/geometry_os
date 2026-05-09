; DESCRIPTION: Draws a white line from (344, 129) to (57, 235).
; PLAN: r0=344(x1), r1=129(y1), r2=57(x2), r3=235(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 129
LDI r2, 57
LDI r3, 235
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
