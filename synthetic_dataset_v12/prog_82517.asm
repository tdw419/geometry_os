; DESCRIPTION: Places a cyan line segment connecting (299, 126) to (132, 51).
; PLAN: r0=299(x1), r1=126(y1), r2=132(x2), r3=51(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 126
LDI r2, 132
LDI r3, 51
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
