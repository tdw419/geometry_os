; DESCRIPTION: Draws a white line from (118, 93) to (415, 174).
; PLAN: r0=118(x1), r1=93(y1), r2=415(x2), r3=174(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 93
LDI r2, 415
LDI r3, 174
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
