; DESCRIPTION: Renders a cyan box of size 97x93 starting at (43, 111).
; PLAN: r0=43(x), r1=111(y), r2=97(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 111
LDI r2, 97
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
