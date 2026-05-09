; DESCRIPTION: Draws a green line from (386, 63) to (84, 128).
; PLAN: r0=386(x1), r1=63(y1), r2=84(x2), r3=128(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 63
LDI r2, 84
LDI r3, 128
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
