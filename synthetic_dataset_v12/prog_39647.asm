; DESCRIPTION: Draws a white line from (199, 82) to (179, 151).
; PLAN: r0=199(x1), r1=82(y1), r2=179(x2), r3=151(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 82
LDI r2, 179
LDI r3, 151
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
