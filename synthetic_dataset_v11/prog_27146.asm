; DESCRIPTION: Renders a white box of size 94x53 starting at (128, 166).
; PLAN: r0=128(x), r1=166(y), r2=94(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 166
LDI r2, 94
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
