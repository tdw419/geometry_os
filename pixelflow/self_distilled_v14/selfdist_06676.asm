; DESCRIPTION: Draws a white line from (127, 146) to (352, 12).
; PLAN: r0=127(x1), r1=146(y1), r2=352(x2), r3=12(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 146
LDI r2, 352
LDI r3, 12
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
