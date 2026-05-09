; DESCRIPTION: Renders a green box of size 14x23 starting at (138, 111).
; PLAN: r0=138(x), r1=111(y), r2=14(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 111
LDI r2, 14
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
