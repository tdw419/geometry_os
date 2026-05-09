; DESCRIPTION: Places a cyan line segment connecting (171, 107) to (79, 4).
; PLAN: r0=171(x1), r1=107(y1), r2=79(x2), r3=4(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 107
LDI r2, 79
LDI r3, 4
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
