; DESCRIPTION: Draws a black line from (284, 128) to (240, 185).
; PLAN: r0=284(x1), r1=128(y1), r2=240(x2), r3=185(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 128
LDI r2, 240
LDI r3, 185
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
