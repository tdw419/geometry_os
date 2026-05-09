; DESCRIPTION: Places a cyan line segment connecting (359, 247) to (175, 48).
; PLAN: r0=359(x1), r1=247(y1), r2=175(x2), r3=48(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 247
LDI r2, 175
LDI r3, 48
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
