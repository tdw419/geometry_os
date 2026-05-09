; DESCRIPTION: Draws a black line from (202, 67) to (417, 161).
; PLAN: r0=202(x1), r1=67(y1), r2=417(x2), r3=161(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 67
LDI r2, 417
LDI r3, 161
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
