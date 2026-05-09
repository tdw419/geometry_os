; DESCRIPTION: Draws a black line from (241, 128) to (460, 27).
; PLAN: r0=241(x1), r1=128(y1), r2=460(x2), r3=27(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 128
LDI r2, 460
LDI r3, 27
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
