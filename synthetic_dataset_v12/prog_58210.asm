; DESCRIPTION: Draws a orange line from (160, 210) to (356, 27).
; PLAN: r0=160(x1), r1=210(y1), r2=356(x2), r3=27(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 210
LDI r2, 356
LDI r3, 27
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
