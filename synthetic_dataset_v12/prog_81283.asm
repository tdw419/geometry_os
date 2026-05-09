; DESCRIPTION: Renders a cyan box of size 81x71 starting at (168, 64).
; PLAN: r0=168(x), r1=64(y), r2=81(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 64
LDI r2, 81
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
