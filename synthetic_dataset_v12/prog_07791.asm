; DESCRIPTION: Draws a green line from (468, 39) to (356, 210).
; PLAN: r0=468(x1), r1=39(y1), r2=356(x2), r3=210(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 39
LDI r2, 356
LDI r3, 210
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
