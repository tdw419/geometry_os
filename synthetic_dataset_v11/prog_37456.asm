; DESCRIPTION: Draws a green line from (74, 27) to (46, 176).
; PLAN: r0=74(x1), r1=27(y1), r2=46(x2), r3=176(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 27
LDI r2, 46
LDI r3, 176
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
