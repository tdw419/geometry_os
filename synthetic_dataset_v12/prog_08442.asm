; DESCRIPTION: Places a cyan line segment connecting (121, 248) to (120, 193).
; PLAN: r0=121(x1), r1=248(y1), r2=120(x2), r3=193(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 248
LDI r2, 120
LDI r3, 193
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
