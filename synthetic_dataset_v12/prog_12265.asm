; DESCRIPTION: Renders a orange box of size 71x42 starting at (438, 64).
; PLAN: r0=438(x), r1=64(y), r2=71(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 64
LDI r2, 71
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
