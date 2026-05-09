; DESCRIPTION: Draws a green line from (346, 144) to (421, 108).
; PLAN: r0=346(x1), r1=144(y1), r2=421(x2), r3=108(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 144
LDI r2, 421
LDI r3, 108
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
