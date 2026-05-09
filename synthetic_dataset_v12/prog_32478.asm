; DESCRIPTION: Draws a black line from (410, 57) to (221, 32).
; PLAN: r0=410(x1), r1=57(y1), r2=221(x2), r3=32(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 57
LDI r2, 221
LDI r3, 32
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
