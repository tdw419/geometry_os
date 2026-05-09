; DESCRIPTION: Renders a cyan box of size 64x76 starting at (81, 82).
; PLAN: r0=81(x), r1=82(y), r2=64(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 82
LDI r2, 64
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
