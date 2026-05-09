; DESCRIPTION: Renders a orange box of size 32x64 starting at (340, 120).
; PLAN: r0=340(x), r1=120(y), r2=32(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 120
LDI r2, 32
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
