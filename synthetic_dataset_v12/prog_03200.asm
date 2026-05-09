; DESCRIPTION: Places a cyan line segment connecting (313, 27) to (306, 31).
; PLAN: r0=313(x1), r1=27(y1), r2=306(x2), r3=31(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 27
LDI r2, 306
LDI r3, 31
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
