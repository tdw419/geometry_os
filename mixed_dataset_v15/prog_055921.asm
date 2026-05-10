; DESCRIPTION: Renders a cyan line segment connecting (134, 171) to (188, 32).
; PLAN: r0=134(x1), r1=171(y1), r2=188(x2), r3=32(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 171
LDI r2, 188
LDI r3, 32
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
