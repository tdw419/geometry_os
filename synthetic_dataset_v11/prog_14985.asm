; DESCRIPTION: Draws a white line from (143, 154) to (199, 139).
; PLAN: r0=143(x1), r1=154(y1), r2=199(x2), r3=139(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 154
LDI r2, 199
LDI r3, 139
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
