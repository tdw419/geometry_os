; DESCRIPTION: Places a green line segment connecting (309, 64) to (292, 27).
; PLAN: r0=309(x1), r1=64(y1), r2=292(x2), r3=27(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 64
LDI r2, 292
LDI r3, 27
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
