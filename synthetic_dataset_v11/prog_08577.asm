; DESCRIPTION: Renders a red box of size 61x80 starting at (128, 13).
; PLAN: r0=128(x), r1=13(y), r2=61(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 13
LDI r2, 61
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
