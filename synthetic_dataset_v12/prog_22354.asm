; DESCRIPTION: Renders a orange box of size 105x16 starting at (404, 3).
; PLAN: r0=404(x), r1=3(y), r2=105(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 3
LDI r2, 105
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
