; DESCRIPTION: Renders a white box of size 33x15 starting at (57, 220).
; PLAN: r0=57(x), r1=220(y), r2=33(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 220
LDI r2, 33
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
