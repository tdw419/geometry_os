; DESCRIPTION: Places a green line segment connecting (279, 63) to (294, 93).
; PLAN: r0=279(x1), r1=63(y1), r2=294(x2), r3=93(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 63
LDI r2, 294
LDI r3, 93
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
