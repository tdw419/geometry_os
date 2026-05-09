; DESCRIPTION: Draws a black line from (239, 114) to (42, 45).
; PLAN: r0=239(x1), r1=114(y1), r2=42(x2), r3=45(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 114
LDI r2, 42
LDI r3, 45
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
