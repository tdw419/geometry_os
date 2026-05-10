; DESCRIPTION: Places a white line segment connecting (295, 236) to (449, 234).
; PLAN: r0=295(x1), r1=236(y1), r2=449(x2), r3=234(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 236
LDI r2, 449
LDI r3, 234
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
