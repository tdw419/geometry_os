; DESCRIPTION: Renders a cyan box of size 77x74 starting at (128, 156).
; PLAN: r0=128(x), r1=156(y), r2=77(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 156
LDI r2, 77
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
