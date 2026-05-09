; DESCRIPTION: Renders a orange box of size 101x112 starting at (392, 80).
; PLAN: r0=392(x), r1=80(y), r2=101(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 80
LDI r2, 101
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
