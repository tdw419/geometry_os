; DESCRIPTION: Renders a white box of size 21x29 starting at (46, 39).
; PLAN: r0=46(x), r1=39(y), r2=21(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 39
LDI r2, 21
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
