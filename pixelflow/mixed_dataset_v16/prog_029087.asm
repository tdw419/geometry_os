; DESCRIPTION: Draws a black line from (401, 142) to (270, 42).
; PLAN: r0=401(x1), r1=142(y1), r2=270(x2), r3=42(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 142
LDI r2, 270
LDI r3, 42
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
