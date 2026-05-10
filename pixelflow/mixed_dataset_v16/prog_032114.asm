; DESCRIPTION: Renders a white box of size 44x120 starting at (383, 84).
; PLAN: r0=383(x), r1=84(y), r2=44(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 84
LDI r2, 44
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
