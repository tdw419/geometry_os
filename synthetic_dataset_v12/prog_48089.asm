; DESCRIPTION: Draws a white line from (380, 64) to (413, 202).
; PLAN: r0=380(x1), r1=64(y1), r2=413(x2), r3=202(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 64
LDI r2, 413
LDI r3, 202
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
