; DESCRIPTION: Draws a orange line from (460, 131) to (480, 166).
; PLAN: r0=460(x1), r1=131(y1), r2=480(x2), r3=166(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 131
LDI r2, 480
LDI r3, 166
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
