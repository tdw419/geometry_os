; DESCRIPTION: Renders a cyan box of size 96x14 starting at (397, 42).
; PLAN: r0=397(x), r1=42(y), r2=96(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 42
LDI r2, 96
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
