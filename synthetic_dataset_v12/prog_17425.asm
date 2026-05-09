; DESCRIPTION: Draws a white line from (401, 235) to (95, 64).
; PLAN: r0=401(x1), r1=235(y1), r2=95(x2), r3=64(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 235
LDI r2, 95
LDI r3, 64
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
