; DESCRIPTION: Renders a white box of size 54x16 starting at (138, 60).
; PLAN: r0=138(x), r1=60(y), r2=54(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 60
LDI r2, 54
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
