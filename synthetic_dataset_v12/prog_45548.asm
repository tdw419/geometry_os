; DESCRIPTION: Places a cyan line segment connecting (187, 107) to (452, 60).
; PLAN: r0=187(x1), r1=107(y1), r2=452(x2), r3=60(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 107
LDI r2, 452
LDI r3, 60
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
