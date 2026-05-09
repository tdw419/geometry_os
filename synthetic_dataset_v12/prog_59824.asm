; DESCRIPTION: Renders a white box of size 44x67 starting at (57, 80).
; PLAN: r0=57(x), r1=80(y), r2=44(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 80
LDI r2, 44
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
