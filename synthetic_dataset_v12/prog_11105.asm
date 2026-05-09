; DESCRIPTION: Renders a orange box of size 36x39 starting at (382, 171).
; PLAN: r0=382(x), r1=171(y), r2=36(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 171
LDI r2, 36
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
