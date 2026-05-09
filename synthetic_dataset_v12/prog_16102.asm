; DESCRIPTION: Draws a green line from (271, 93) to (449, 93).
; PLAN: r0=271(x1), r1=93(y1), r2=449(x2), r3=93(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 93
LDI r2, 449
LDI r3, 93
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
