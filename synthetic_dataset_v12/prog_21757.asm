; DESCRIPTION: Renders a orange box of size 21x18 starting at (403, 159).
; PLAN: r0=403(x), r1=159(y), r2=21(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 159
LDI r2, 21
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
