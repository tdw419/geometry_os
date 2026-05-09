; DESCRIPTION: Renders a green box of size 48x78 starting at (71, 111).
; PLAN: r0=71(x), r1=111(y), r2=48(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 111
LDI r2, 48
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
