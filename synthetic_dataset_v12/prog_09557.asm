; DESCRIPTION: Renders a orange box of size 120x32 starting at (21, 9).
; PLAN: r0=21(x), r1=9(y), r2=120(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 9
LDI r2, 120
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
