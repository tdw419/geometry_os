; DESCRIPTION: Places a cyan line segment connecting (330, 161) to (230, 191).
; PLAN: r0=330(x1), r1=161(y1), r2=230(x2), r3=191(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 161
LDI r2, 230
LDI r3, 191
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
