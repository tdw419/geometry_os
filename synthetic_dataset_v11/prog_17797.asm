; DESCRIPTION: Places a cyan line segment connecting (213, 92) to (162, 239).
; PLAN: r0=213(x1), r1=92(y1), r2=162(x2), r3=239(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 92
LDI r2, 162
LDI r3, 239
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
