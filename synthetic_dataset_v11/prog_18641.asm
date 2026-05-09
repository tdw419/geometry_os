; DESCRIPTION: Renders a orange box of size 42x81 starting at (47, 111).
; PLAN: r0=47(x), r1=111(y), r2=42(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 111
LDI r2, 42
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
