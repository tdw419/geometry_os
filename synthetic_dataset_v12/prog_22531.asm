; DESCRIPTION: Draws a green line from (327, 69) to (66, 33).
; PLAN: r0=327(x1), r1=69(y1), r2=66(x2), r3=33(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 69
LDI r2, 66
LDI r3, 33
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
