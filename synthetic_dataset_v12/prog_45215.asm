; DESCRIPTION: Places a cyan line segment connecting (32, 178) to (391, 40).
; PLAN: r0=32(x1), r1=178(y1), r2=391(x2), r3=40(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 178
LDI r2, 391
LDI r3, 40
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
