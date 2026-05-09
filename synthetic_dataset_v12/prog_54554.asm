; DESCRIPTION: Renders a orange box of size 52x47 starting at (271, 120).
; PLAN: r0=271(x), r1=120(y), r2=52(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 120
LDI r2, 52
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
