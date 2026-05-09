; DESCRIPTION: Renders a white box of size 44x55 starting at (75, 151).
; PLAN: r0=75(x), r1=151(y), r2=44(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 151
LDI r2, 44
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
