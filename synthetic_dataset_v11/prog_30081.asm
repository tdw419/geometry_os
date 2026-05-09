; DESCRIPTION: Places a cyan line segment connecting (203, 91) to (57, 125).
; PLAN: r0=203(x1), r1=91(y1), r2=57(x2), r3=125(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 91
LDI r2, 57
LDI r3, 125
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
