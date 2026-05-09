; DESCRIPTION: Renders a white box of size 33x16 starting at (39, 178).
; PLAN: r0=39(x), r1=178(y), r2=33(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 178
LDI r2, 33
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
