; DESCRIPTION: Renders a cyan box of size 32x67 starting at (178, 185).
; PLAN: r0=178(x), r1=185(y), r2=32(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 185
LDI r2, 32
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
