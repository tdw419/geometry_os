; DESCRIPTION: Draws a green line from (392, 223) to (295, 160).
; PLAN: r0=392(x1), r1=223(y1), r2=295(x2), r3=160(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 223
LDI r2, 295
LDI r3, 160
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
