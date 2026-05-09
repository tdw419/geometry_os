; DESCRIPTION: Renders a red box of size 49x64 starting at (32, 86).
; PLAN: r0=32(x), r1=86(y), r2=49(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 86
LDI r2, 49
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
