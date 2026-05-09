; DESCRIPTION: Renders a cyan box of size 114x48 starting at (32, 49).
; PLAN: r0=32(x), r1=49(y), r2=114(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 49
LDI r2, 114
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
