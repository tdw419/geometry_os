; DESCRIPTION: Places a cyan line segment connecting (159, 69) to (161, 250).
; PLAN: r0=159(x1), r1=69(y1), r2=161(x2), r3=250(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 69
LDI r2, 161
LDI r3, 250
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
