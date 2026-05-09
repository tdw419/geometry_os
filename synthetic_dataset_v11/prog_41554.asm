; DESCRIPTION: Renders a white box of size 94x32 starting at (28, 0).
; PLAN: r0=28(x), r1=0(y), r2=94(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 0
LDI r2, 94
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
