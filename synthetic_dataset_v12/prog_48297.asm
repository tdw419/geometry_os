; DESCRIPTION: Renders a cyan box of size 73x105 starting at (128, 82).
; PLAN: r0=128(x), r1=82(y), r2=73(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 82
LDI r2, 73
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
