; DESCRIPTION: Renders a orange box of size 12x58 starting at (487, 120).
; PLAN: r0=487(x), r1=120(y), r2=12(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 120
LDI r2, 12
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
