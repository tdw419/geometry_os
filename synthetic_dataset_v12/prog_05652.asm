; DESCRIPTION: Draws a green line from (420, 71) to (152, 107).
; PLAN: r0=420(x1), r1=71(y1), r2=152(x2), r3=107(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 71
LDI r2, 152
LDI r3, 107
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
