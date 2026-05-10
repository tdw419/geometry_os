; DESCRIPTION: Places a cyan line segment connecting (240, 107) to (321, 98).
; PLAN: r0=240(x1), r1=107(y1), r2=321(x2), r3=98(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 107
LDI r2, 321
LDI r3, 98
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
