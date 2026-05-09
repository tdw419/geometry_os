; DESCRIPTION: Draws a green line from (57, 27) to (207, 9).
; PLAN: r0=57(x1), r1=27(y1), r2=207(x2), r3=9(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 27
LDI r2, 207
LDI r3, 9
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
