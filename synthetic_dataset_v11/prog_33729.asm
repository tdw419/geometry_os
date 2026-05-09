; DESCRIPTION: Renders a white box of size 97x80 starting at (106, 82).
; PLAN: r0=106(x), r1=82(y), r2=97(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 82
LDI r2, 97
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
