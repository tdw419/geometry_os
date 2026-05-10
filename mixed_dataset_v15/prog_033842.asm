; DESCRIPTION: Renders a orange box of size 37x27 starting at (135, 32).
; PLAN: r0=135(x), r1=32(y), r2=37(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 32
LDI r2, 37
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
