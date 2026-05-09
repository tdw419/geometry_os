; DESCRIPTION: Renders a white box of size 107x59 starting at (263, 90).
; PLAN: r0=263(x), r1=90(y), r2=107(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 90
LDI r2, 107
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
