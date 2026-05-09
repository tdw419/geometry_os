; DESCRIPTION: Draws a green line from (218, 206) to (152, 26).
; PLAN: r0=218(x1), r1=206(y1), r2=152(x2), r3=26(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 206
LDI r2, 152
LDI r3, 26
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
