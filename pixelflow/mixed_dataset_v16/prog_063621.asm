; DESCRIPTION: Places a green line segment connecting (340, 111) to (405, 132).
; PLAN: r0=340(x1), r1=111(y1), r2=405(x2), r3=132(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 111
LDI r2, 405
LDI r3, 132
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
