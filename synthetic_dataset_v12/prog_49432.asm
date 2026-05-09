; DESCRIPTION: Places a green line segment connecting (486, 180) to (445, 242).
; PLAN: r0=486(x1), r1=180(y1), r2=445(x2), r3=242(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 180
LDI r2, 445
LDI r3, 242
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
