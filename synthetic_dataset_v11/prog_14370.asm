; DESCRIPTION: Renders a red box of size 19x62 starting at (150, 111).
; PLAN: r0=150(x), r1=111(y), r2=19(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 111
LDI r2, 19
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
