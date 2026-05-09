; DESCRIPTION: Draws a black line from (386, 79) to (354, 197).
; PLAN: r0=386(x1), r1=79(y1), r2=354(x2), r3=197(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 79
LDI r2, 354
LDI r3, 197
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
