; DESCRIPTION: Draws a black line from (510, 224) to (326, 164).
; PLAN: r0=510(x1), r1=224(y1), r2=326(x2), r3=164(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 224
LDI r2, 326
LDI r3, 164
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
