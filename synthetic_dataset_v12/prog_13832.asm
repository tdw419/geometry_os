; DESCRIPTION: Places a cyan line segment connecting (354, 2) to (206, 4).
; PLAN: r0=354(x1), r1=2(y1), r2=206(x2), r3=4(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 2
LDI r2, 206
LDI r3, 4
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
