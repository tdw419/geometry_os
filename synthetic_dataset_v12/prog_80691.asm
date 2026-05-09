; DESCRIPTION: Renders a white box of size 22x19 starting at (413, 16).
; PLAN: r0=413(x), r1=16(y), r2=22(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 16
LDI r2, 22
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
