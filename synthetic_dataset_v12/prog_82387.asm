; DESCRIPTION: Renders a white box of size 54x10 starting at (356, 35).
; PLAN: r0=356(x), r1=35(y), r2=54(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 35
LDI r2, 54
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
