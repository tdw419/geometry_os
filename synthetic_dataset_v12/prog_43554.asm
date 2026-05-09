; DESCRIPTION: Draws a black line from (350, 205) to (48, 208).
; PLAN: r0=350(x1), r1=205(y1), r2=48(x2), r3=208(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 205
LDI r2, 48
LDI r3, 208
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
