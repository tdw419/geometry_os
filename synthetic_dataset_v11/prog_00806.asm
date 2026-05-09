; DESCRIPTION: Draws a white line from (154, 180) to (117, 141).
; PLAN: r0=154(x1), r1=180(y1), r2=117(x2), r3=141(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 180
LDI r2, 117
LDI r3, 141
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
