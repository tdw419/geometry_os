; DESCRIPTION: Places a cyan line segment connecting (275, 115) to (105, 243).
; PLAN: r0=275(x1), r1=115(y1), r2=105(x2), r3=243(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 115
LDI r2, 105
LDI r3, 243
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
