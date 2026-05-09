; DESCRIPTION: Renders a cyan box of size 32x18 starting at (202, 84).
; PLAN: r0=202(x), r1=84(y), r2=32(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 84
LDI r2, 32
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
