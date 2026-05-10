; DESCRIPTION: Renders a red box of size 39x95 starting at (154, 128).
; PLAN: r0=154(x), r1=128(y), r2=39(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 128
LDI r2, 39
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
