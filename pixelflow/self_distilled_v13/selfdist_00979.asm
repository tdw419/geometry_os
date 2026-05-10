; DESCRIPTION: Renders a magenta line segment connecting (13, 197) to (320, 128).
; PLAN: r0=13(x1), r1=197(y1), r2=320(x2), r3=128(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 197
LDI r2, 320
LDI r3, 128
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
