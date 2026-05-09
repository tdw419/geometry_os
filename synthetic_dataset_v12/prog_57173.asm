; DESCRIPTION: Renders a white box of size 94x56 starting at (195, 90).
; PLAN: r0=195(x), r1=90(y), r2=94(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 90
LDI r2, 94
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
