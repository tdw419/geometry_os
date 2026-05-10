; DESCRIPTION: Renders a white rectangular region spanning 97 by 32 at (29, 86).
; PLAN: r0=29(x), r1=86(y), r2=97(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 86
LDI r2, 97
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
