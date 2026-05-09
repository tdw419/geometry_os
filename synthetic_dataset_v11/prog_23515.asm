; DESCRIPTION: Renders a cyan box of size 82x98 starting at (100, 136).
; PLAN: r0=100(x), r1=136(y), r2=82(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 136
LDI r2, 82
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
