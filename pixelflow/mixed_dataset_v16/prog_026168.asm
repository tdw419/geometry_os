; DESCRIPTION: Renders a red box of size 82x67 starting at (211, 38).
; PLAN: r0=211(x), r1=38(y), r2=82(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 38
LDI r2, 82
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
