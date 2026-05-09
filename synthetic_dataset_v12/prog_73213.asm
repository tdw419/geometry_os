; DESCRIPTION: Renders a orange box of size 94x67 starting at (272, 183).
; PLAN: r0=272(x), r1=183(y), r2=94(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 183
LDI r2, 94
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
