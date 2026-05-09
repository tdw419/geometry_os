; DESCRIPTION: Places a cyan line segment connecting (410, 226) to (62, 165).
; PLAN: r0=410(x1), r1=226(y1), r2=62(x2), r3=165(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 226
LDI r2, 62
LDI r3, 165
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
