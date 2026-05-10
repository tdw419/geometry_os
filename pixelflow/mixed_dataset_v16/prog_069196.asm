; DESCRIPTION: Renders a orange box of size 47x74 starting at (33, 32).
; PLAN: r0=33(x), r1=32(y), r2=47(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 32
LDI r2, 47
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
