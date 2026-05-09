; DESCRIPTION: Draws a white line from (27, 44) to (268, 38).
; PLAN: r0=27(x1), r1=44(y1), r2=268(x2), r3=38(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 44
LDI r2, 268
LDI r3, 38
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
