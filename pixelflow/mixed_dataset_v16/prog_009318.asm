; DESCRIPTION: Places a cyan line segment connecting (499, 200) to (70, 37).
; PLAN: r0=499(x1), r1=200(y1), r2=70(x2), r3=37(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 200
LDI r2, 70
LDI r3, 37
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
