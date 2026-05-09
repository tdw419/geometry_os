; DESCRIPTION: Renders a cyan box of size 24x10 starting at (178, 32).
; PLAN: r0=178(x), r1=32(y), r2=24(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 32
LDI r2, 24
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
