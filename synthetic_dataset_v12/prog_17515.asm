; DESCRIPTION: Draws a white line from (86, 174) to (450, 213).
; PLAN: r0=86(x1), r1=174(y1), r2=450(x2), r3=213(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 174
LDI r2, 450
LDI r3, 213
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
