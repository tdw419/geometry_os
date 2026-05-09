; DESCRIPTION: Places a white line segment connecting (475, 228) to (46, 107).
; PLAN: r0=475(x1), r1=228(y1), r2=46(x2), r3=107(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 228
LDI r2, 46
LDI r3, 107
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
