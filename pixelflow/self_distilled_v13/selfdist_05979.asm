; DESCRIPTION: Creates a white filled rectangle of size 56x11 starting at (37, 111).
; PLAN: r0=37(x), r1=111(y), r2=56(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 111
LDI r2, 56
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
