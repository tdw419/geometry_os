; DESCRIPTION: Renders a green box of size 53x36 starting at (171, 85).
; PLAN: r0=171(x), r1=85(y), r2=53(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 85
LDI r2, 53
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
