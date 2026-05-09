; DESCRIPTION: Places a cyan line segment connecting (210, 207) to (191, 69).
; PLAN: r0=210(x1), r1=207(y1), r2=191(x2), r3=69(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 207
LDI r2, 191
LDI r3, 69
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
