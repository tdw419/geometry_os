; DESCRIPTION: Places a green line segment connecting (209, 173) to (82, 81).
; PLAN: r0=209(x1), r1=173(y1), r2=82(x2), r3=81(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 173
LDI r2, 82
LDI r3, 81
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
