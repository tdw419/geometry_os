; DESCRIPTION: Places a yellow line segment connecting (506, 231) to (354, 27).
; PLAN: r0=506(x1), r1=231(y1), r2=354(x2), r3=27(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 231
LDI r2, 354
LDI r3, 27
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
