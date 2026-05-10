; DESCRIPTION: Creates a white filled rectangle of size 77x99 starting at (77, 111).
; PLAN: r0=77(x), r1=111(y), r2=77(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 111
LDI r2, 77
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
