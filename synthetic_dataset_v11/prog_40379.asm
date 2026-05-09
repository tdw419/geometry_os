; DESCRIPTION: Renders a white box of size 16x111 starting at (183, 40).
; PLAN: r0=183(x), r1=40(y), r2=16(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 40
LDI r2, 16
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
