; DESCRIPTION: Draws a green line from (217, 36) to (2, 213).
; PLAN: r0=217(x1), r1=36(y1), r2=2(x2), r3=213(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 36
LDI r2, 2
LDI r3, 213
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
