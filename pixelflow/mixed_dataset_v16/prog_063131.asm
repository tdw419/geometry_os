; DESCRIPTION: Renders a cyan box of size 32x15 starting at (196, 240).
; PLAN: r0=196(x), r1=240(y), r2=32(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 240
LDI r2, 32
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
