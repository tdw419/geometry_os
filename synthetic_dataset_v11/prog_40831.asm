; DESCRIPTION: Places a red 18x75 rectangle at position (185, 111).
; PLAN: r0=185(x), r1=111(y), r2=18(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 111
LDI r2, 18
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
