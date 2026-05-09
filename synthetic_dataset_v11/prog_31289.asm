; DESCRIPTION: Places a cyan line segment connecting (231, 59) to (136, 125).
; PLAN: r0=231(x1), r1=59(y1), r2=136(x2), r3=125(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 59
LDI r2, 136
LDI r3, 125
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
