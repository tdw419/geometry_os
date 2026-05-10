; DESCRIPTION: Places a cyan line segment connecting (313, 149) to (182, 183).
; PLAN: r0=313(x1), r1=149(y1), r2=182(x2), r3=183(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 149
LDI r2, 182
LDI r3, 183
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
