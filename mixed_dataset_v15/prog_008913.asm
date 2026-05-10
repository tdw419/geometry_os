; DESCRIPTION: Draws a green line from (5, 215) to (449, 29).
; PLAN: r0=5(x1), r1=215(y1), r2=449(x2), r3=29(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 215
LDI r2, 449
LDI r3, 29
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
