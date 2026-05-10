; DESCRIPTION: Renders a white box of size 44x73 starting at (386, 157).
; PLAN: r0=386(x), r1=157(y), r2=44(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 157
LDI r2, 44
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
