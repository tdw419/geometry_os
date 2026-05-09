; DESCRIPTION: Places a cyan line segment connecting (454, 220) to (164, 150).
; PLAN: r0=454(x1), r1=220(y1), r2=164(x2), r3=150(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 220
LDI r2, 164
LDI r3, 150
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
