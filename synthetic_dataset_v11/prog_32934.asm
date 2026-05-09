; DESCRIPTION: Renders a red box of size 42x97 starting at (117, 128).
; PLAN: r0=117(x), r1=128(y), r2=42(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 128
LDI r2, 42
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
