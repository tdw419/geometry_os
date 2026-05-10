; DESCRIPTION: Places a orange line segment connecting (146, 186) to (73, 166).
; PLAN: r0=146(x1), r1=186(y1), r2=73(x2), r3=166(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 186
LDI r2, 73
LDI r3, 166
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
