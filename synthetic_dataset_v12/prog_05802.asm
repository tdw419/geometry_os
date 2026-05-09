; DESCRIPTION: Places a white line segment connecting (76, 197) to (268, 111).
; PLAN: r0=76(x1), r1=197(y1), r2=268(x2), r3=111(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 197
LDI r2, 268
LDI r3, 111
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
