; DESCRIPTION: Places a cyan line segment connecting (71, 27) to (105, 17).
; PLAN: r0=71(x1), r1=27(y1), r2=105(x2), r3=17(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 27
LDI r2, 105
LDI r3, 17
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
