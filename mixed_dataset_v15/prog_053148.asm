; DESCRIPTION: Places a cyan line segment connecting (268, 202) to (177, 107).
; PLAN: r0=268(x1), r1=202(y1), r2=177(x2), r3=107(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 202
LDI r2, 177
LDI r3, 107
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
