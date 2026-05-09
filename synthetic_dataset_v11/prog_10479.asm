; DESCRIPTION: Draws a cyan line from (105, 247) to (146, 203).
; PLAN: r0=105(x1), r1=247(y1), r2=146(x2), r3=203(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 247
LDI r2, 146
LDI r3, 203
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
