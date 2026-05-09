; DESCRIPTION: Renders a red box of size 39x26 starting at (320, 117).
; PLAN: r0=320(x), r1=117(y), r2=39(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 117
LDI r2, 39
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
