; DESCRIPTION: Renders a cyan box of size 21x28 starting at (32, 84).
; PLAN: r0=32(x), r1=84(y), r2=21(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 84
LDI r2, 21
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
