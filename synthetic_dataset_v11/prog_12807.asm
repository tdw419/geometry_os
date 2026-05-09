; DESCRIPTION: Draws a green line from (214, 68) to (130, 111).
; PLAN: r0=214(x1), r1=68(y1), r2=130(x2), r3=111(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 68
LDI r2, 130
LDI r3, 111
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
