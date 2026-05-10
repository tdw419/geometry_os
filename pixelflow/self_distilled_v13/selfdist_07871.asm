; DESCRIPTION: Creates a orange filled rectangle of size 120x74 starting at (158, 111).
; PLAN: r0=158(x), r1=111(y), r2=120(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 111
LDI r2, 120
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
