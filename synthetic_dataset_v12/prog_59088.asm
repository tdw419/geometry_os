; DESCRIPTION: Places a cyan line segment connecting (333, 69) to (151, 132).
; PLAN: r0=333(x1), r1=69(y1), r2=151(x2), r3=132(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 69
LDI r2, 151
LDI r3, 132
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
