; DESCRIPTION: Renders a green box of size 40x57 starting at (371, 111).
; PLAN: r0=371(x), r1=111(y), r2=40(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 111
LDI r2, 40
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
