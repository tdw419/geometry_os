; DESCRIPTION: Draws a green line from (175, 85) to (61, 210).
; PLAN: r0=175(x1), r1=85(y1), r2=61(x2), r3=210(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 85
LDI r2, 61
LDI r3, 210
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
