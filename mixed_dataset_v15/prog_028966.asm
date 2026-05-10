; DESCRIPTION: Places a cyan line segment connecting (99, 48) to (17, 243).
; PLAN: r0=99(x1), r1=48(y1), r2=17(x2), r3=243(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 48
LDI r2, 17
LDI r3, 243
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
