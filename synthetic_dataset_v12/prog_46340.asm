; DESCRIPTION: Draws a purple line from (460, 146) to (18, 27).
; PLAN: r0=460(x1), r1=146(y1), r2=18(x2), r3=27(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 146
LDI r2, 18
LDI r3, 27
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
