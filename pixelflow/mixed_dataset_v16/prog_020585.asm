; DESCRIPTION: Draws a green line from (392, 24) to (3, 166).
; PLAN: r0=392(x1), r1=24(y1), r2=3(x2), r3=166(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 24
LDI r2, 3
LDI r3, 166
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
