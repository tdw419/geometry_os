; DESCRIPTION: Places a cyan line segment connecting (98, 243) to (56, 132).
; PLAN: r0=98(x1), r1=243(y1), r2=56(x2), r3=132(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 243
LDI r2, 56
LDI r3, 132
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
