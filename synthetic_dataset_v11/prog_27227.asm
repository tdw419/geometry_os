; DESCRIPTION: Renders a cyan box of size 48x70 starting at (64, 81).
; PLAN: r0=64(x), r1=81(y), r2=48(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 81
LDI r2, 48
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
