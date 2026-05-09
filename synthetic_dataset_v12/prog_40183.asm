; DESCRIPTION: Draws a green line from (150, 67) to (46, 34).
; PLAN: r0=150(x1), r1=67(y1), r2=46(x2), r3=34(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 67
LDI r2, 46
LDI r3, 34
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
