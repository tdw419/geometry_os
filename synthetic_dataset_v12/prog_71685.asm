; DESCRIPTION: Renders a red box of size 67x13 starting at (228, 142).
; PLAN: r0=228(x), r1=142(y), r2=67(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 142
LDI r2, 67
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
