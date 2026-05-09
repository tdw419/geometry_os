; DESCRIPTION: Places a cyan line segment connecting (226, 148) to (307, 203).
; PLAN: r0=226(x1), r1=148(y1), r2=307(x2), r3=203(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 148
LDI r2, 307
LDI r3, 203
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
