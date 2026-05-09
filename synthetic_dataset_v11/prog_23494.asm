; DESCRIPTION: Draws a black line from (103, 240) to (25, 42).
; PLAN: r0=103(x1), r1=240(y1), r2=25(x2), r3=42(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 240
LDI r2, 25
LDI r3, 42
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
