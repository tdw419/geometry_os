; DESCRIPTION: Places a cyan line segment connecting (338, 138) to (188, 173).
; PLAN: r0=338(x1), r1=138(y1), r2=188(x2), r3=173(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 138
LDI r2, 188
LDI r3, 173
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
