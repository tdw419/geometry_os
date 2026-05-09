; DESCRIPTION: Renders a orange line between points (146, 226) and (75, 113).
; PLAN: r0=146(x1), r1=226(y1), r2=75(x2), r3=113(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 226
LDI r2, 75
LDI r3, 113
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
