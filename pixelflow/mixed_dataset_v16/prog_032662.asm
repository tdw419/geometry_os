; DESCRIPTION: Draws a orange line from (146, 125) to (425, 146).
; PLAN: r0=146(x1), r1=125(y1), r2=425(x2), r3=146(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 125
LDI r2, 425
LDI r3, 146
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
