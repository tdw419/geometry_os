; DESCRIPTION: Renders a black line between points (347, 213) and (291, 111).
; PLAN: r0=347(x1), r1=213(y1), r2=291(x2), r3=111(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 213
LDI r2, 291
LDI r3, 111
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
