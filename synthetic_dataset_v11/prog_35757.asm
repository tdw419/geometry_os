; DESCRIPTION: Renders a green box of size 58x39 starting at (173, 74).
; PLAN: r0=173(x), r1=74(y), r2=58(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 74
LDI r2, 58
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
