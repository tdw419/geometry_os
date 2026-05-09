; DESCRIPTION: Renders a orange box of size 61x115 starting at (204, 6).
; PLAN: r0=204(x), r1=6(y), r2=61(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 6
LDI r2, 61
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
