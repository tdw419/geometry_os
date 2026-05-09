; DESCRIPTION: Renders a cyan box of size 83x76 starting at (276, 111).
; PLAN: r0=276(x), r1=111(y), r2=83(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 111
LDI r2, 83
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
