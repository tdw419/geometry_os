; DESCRIPTION: Renders a white box of size 67x98 starting at (61, 16).
; PLAN: r0=61(x), r1=16(y), r2=67(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 16
LDI r2, 67
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
