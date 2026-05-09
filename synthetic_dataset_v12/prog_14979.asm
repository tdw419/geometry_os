; DESCRIPTION: Renders a orange box of size 45x113 starting at (413, 57).
; PLAN: r0=413(x), r1=57(y), r2=45(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 57
LDI r2, 45
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
