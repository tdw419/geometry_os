; DESCRIPTION: Renders a white box of size 16x39 starting at (286, 6).
; PLAN: r0=286(x), r1=6(y), r2=16(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 6
LDI r2, 16
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
