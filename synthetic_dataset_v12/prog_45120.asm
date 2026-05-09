; DESCRIPTION: Renders a orange box of size 83x68 starting at (380, 111).
; PLAN: r0=380(x), r1=111(y), r2=83(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 111
LDI r2, 83
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
