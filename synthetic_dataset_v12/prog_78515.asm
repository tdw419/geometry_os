; DESCRIPTION: Places a green line segment connecting (445, 166) to (297, 120).
; PLAN: r0=445(x1), r1=166(y1), r2=297(x2), r3=120(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 166
LDI r2, 297
LDI r3, 120
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
