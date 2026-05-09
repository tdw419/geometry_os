; DESCRIPTION: Places a green line segment connecting (434, 123) to (182, 27).
; PLAN: r0=434(x1), r1=123(y1), r2=182(x2), r3=27(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 123
LDI r2, 182
LDI r3, 27
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
