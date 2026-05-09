; DESCRIPTION: Renders a cyan box of size 76x72 starting at (18, 63).
; PLAN: r0=18(x), r1=63(y), r2=76(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 63
LDI r2, 76
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
