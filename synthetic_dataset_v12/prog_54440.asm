; DESCRIPTION: Draws a green line from (44, 79) to (67, 213).
; PLAN: r0=44(x1), r1=79(y1), r2=67(x2), r3=213(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 79
LDI r2, 67
LDI r3, 213
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
