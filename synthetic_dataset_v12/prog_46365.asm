; DESCRIPTION: Renders a white box of size 90x63 starting at (315, 4).
; PLAN: r0=315(x), r1=4(y), r2=90(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 4
LDI r2, 90
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
