; DESCRIPTION: Draws a yellow line from (473, 116) to (356, 210).
; PLAN: r0=473(x1), r1=116(y1), r2=356(x2), r3=210(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 116
LDI r2, 356
LDI r3, 210
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
