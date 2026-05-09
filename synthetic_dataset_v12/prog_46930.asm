; DESCRIPTION: Draws a red line from (23, 205) to (426, 171).
; PLAN: r0=23(x1), r1=205(y1), r2=426(x2), r3=171(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 205
LDI r2, 426
LDI r3, 171
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
