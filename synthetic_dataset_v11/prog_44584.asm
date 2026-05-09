; DESCRIPTION: Renders a white box of size 44x60 starting at (60, 14).
; PLAN: r0=60(x), r1=14(y), r2=44(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 14
LDI r2, 44
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
