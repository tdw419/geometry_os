; DESCRIPTION: Renders a orange box of size 86x36 starting at (413, 200).
; PLAN: r0=413(x), r1=200(y), r2=86(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 200
LDI r2, 86
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
