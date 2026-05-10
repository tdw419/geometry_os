; DESCRIPTION: Creates a cyan filled rectangle of size 86x23 starting at (109, 111).
; PLAN: r0=109(x), r1=111(y), r2=86(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 111
LDI r2, 86
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
