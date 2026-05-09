; DESCRIPTION: Renders a orange box of size 16x58 starting at (252, 111).
; PLAN: r0=252(x), r1=111(y), r2=16(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 111
LDI r2, 16
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
