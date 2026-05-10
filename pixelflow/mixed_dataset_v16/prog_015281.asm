; DESCRIPTION: Draws a red line from (213, 214) to (156, 187).
; PLAN: r0=213(x1), r1=214(y1), r2=156(x2), r3=187(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 214
LDI r2, 156
LDI r3, 187
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
