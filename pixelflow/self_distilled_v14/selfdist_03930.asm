; DESCRIPTION: Draws a red line from (179, 180) to (187, 117).
; PLAN: r0=179(x1), r1=180(y1), r2=187(x2), r3=117(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 180
LDI r2, 187
LDI r3, 117
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
