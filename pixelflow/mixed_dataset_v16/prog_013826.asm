; DESCRIPTION: Creates a blue filled rectangle of size 47x22 starting at (2, 111).
; PLAN: r0=2(x), r1=111(y), r2=47(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 111
LDI r2, 47
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
