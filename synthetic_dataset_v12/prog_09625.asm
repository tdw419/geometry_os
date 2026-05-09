; DESCRIPTION: Places a cyan line segment connecting (455, 207) to (499, 48).
; PLAN: r0=455(x1), r1=207(y1), r2=499(x2), r3=48(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 207
LDI r2, 499
LDI r3, 48
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
