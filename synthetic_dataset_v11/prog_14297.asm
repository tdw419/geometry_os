; DESCRIPTION: Renders a white box of size 109x39 starting at (38, 200).
; PLAN: r0=38(x), r1=200(y), r2=109(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 200
LDI r2, 109
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
