; DESCRIPTION: Draws a black line from (420, 19) to (460, 42).
; PLAN: r0=420(x1), r1=19(y1), r2=460(x2), r3=42(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 19
LDI r2, 460
LDI r3, 42
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
