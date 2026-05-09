; DESCRIPTION: Places a green line segment connecting (449, 152) to (362, 171).
; PLAN: r0=449(x1), r1=152(y1), r2=362(x2), r3=171(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 152
LDI r2, 362
LDI r3, 171
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
