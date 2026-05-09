; DESCRIPTION: Draws a black line from (242, 111) to (324, 143).
; PLAN: r0=242(x1), r1=111(y1), r2=324(x2), r3=143(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 111
LDI r2, 324
LDI r3, 143
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
