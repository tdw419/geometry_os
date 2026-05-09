; DESCRIPTION: Draws a black line from (42, 29) to (178, 27).
; PLAN: r0=42(x1), r1=29(y1), r2=178(x2), r3=27(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 29
LDI r2, 178
LDI r3, 27
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
