; DESCRIPTION: Places a cyan line segment connecting (213, 18) to (13, 75).
; PLAN: r0=213(x1), r1=18(y1), r2=13(x2), r3=75(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 18
LDI r2, 13
LDI r3, 75
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
