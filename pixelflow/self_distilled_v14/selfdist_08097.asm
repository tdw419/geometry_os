; DESCRIPTION: Creates a cyan filled rectangle of size 56x51 starting at (50, 111).
; PLAN: r0=50(x), r1=111(y), r2=56(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 111
LDI r2, 56
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
