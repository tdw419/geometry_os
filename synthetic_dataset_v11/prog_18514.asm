; DESCRIPTION: Renders a orange box of size 61x38 starting at (135, 142).
; PLAN: r0=135(x), r1=142(y), r2=61(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 142
LDI r2, 61
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
