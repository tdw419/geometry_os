; DESCRIPTION: Draws a black line from (305, 119) to (356, 42).
; PLAN: r0=305(x1), r1=119(y1), r2=356(x2), r3=42(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 119
LDI r2, 356
LDI r3, 42
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
