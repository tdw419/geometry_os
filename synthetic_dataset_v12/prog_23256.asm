; DESCRIPTION: Draws a cyan line from (152, 107) to (99, 67).
; PLAN: r0=152(x1), r1=107(y1), r2=99(x2), r3=67(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 107
LDI r2, 99
LDI r3, 67
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
