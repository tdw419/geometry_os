; DESCRIPTION: Places a yellow 79x77 rectangle at position (147, 111).
; PLAN: r0=147(x), r1=111(y), r2=79(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 111
LDI r2, 79
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
