; DESCRIPTION: Renders a orange box of size 103x64 starting at (80, 1).
; PLAN: r0=80(x), r1=1(y), r2=103(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 1
LDI r2, 103
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
