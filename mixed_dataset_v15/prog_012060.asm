; DESCRIPTION: Renders a orange line between points (386, 151) and (37, 111).
; PLAN: r0=386(x1), r1=151(y1), r2=37(x2), r3=111(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 151
LDI r2, 37
LDI r3, 111
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
