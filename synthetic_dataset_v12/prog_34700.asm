; DESCRIPTION: Draws a white line from (260, 86) to (168, 111).
; PLAN: r0=260(x1), r1=86(y1), r2=168(x2), r3=111(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 86
LDI r2, 168
LDI r3, 111
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
