; DESCRIPTION: Renders a white box of size 54x47 starting at (0, 72).
; PLAN: r0=0(x), r1=72(y), r2=54(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 72
LDI r2, 54
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
