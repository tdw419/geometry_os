; DESCRIPTION: Places a white line segment connecting (27, 111) to (83, 128).
; PLAN: r0=27(x1), r1=111(y1), r2=83(x2), r3=128(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 111
LDI r2, 83
LDI r3, 128
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
