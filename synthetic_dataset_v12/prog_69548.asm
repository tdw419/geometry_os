; DESCRIPTION: Renders a cyan box of size 72x93 starting at (56, 45).
; PLAN: r0=56(x), r1=45(y), r2=72(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 45
LDI r2, 72
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
