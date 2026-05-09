; DESCRIPTION: Renders a cyan box of size 82x117 starting at (62, 96).
; PLAN: r0=62(x), r1=96(y), r2=82(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 96
LDI r2, 82
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
