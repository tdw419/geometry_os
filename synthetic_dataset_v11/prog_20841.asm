; DESCRIPTION: Places a cyan line segment connecting (7, 25) to (171, 87).
; PLAN: r0=7(x1), r1=25(y1), r2=171(x2), r3=87(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 25
LDI r2, 171
LDI r3, 87
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
