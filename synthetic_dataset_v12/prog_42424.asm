; DESCRIPTION: Draws a green line from (326, 207) to (275, 37).
; PLAN: r0=326(x1), r1=207(y1), r2=275(x2), r3=37(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 207
LDI r2, 275
LDI r3, 37
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
