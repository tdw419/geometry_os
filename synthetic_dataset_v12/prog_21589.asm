; DESCRIPTION: Renders a white box of size 117x47 starting at (67, 37).
; PLAN: r0=67(x), r1=37(y), r2=117(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 37
LDI r2, 117
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
