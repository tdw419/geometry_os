; DESCRIPTION: Renders a white box of size 86x93 starting at (164, 111).
; PLAN: r0=164(x), r1=111(y), r2=86(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 111
LDI r2, 86
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
