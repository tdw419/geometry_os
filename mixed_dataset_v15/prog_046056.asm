; DESCRIPTION: Renders a orange box of size 27x48 starting at (2, 196).
; PLAN: r0=2(x), r1=196(y), r2=27(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 196
LDI r2, 27
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
