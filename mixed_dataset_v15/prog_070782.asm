; DESCRIPTION: Draws a green line from (487, 69) to (15, 111).
; PLAN: r0=487(x1), r1=69(y1), r2=15(x2), r3=111(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 69
LDI r2, 15
LDI r3, 111
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
