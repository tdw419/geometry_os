; DESCRIPTION: Renders a cyan box of size 86x16 starting at (109, 194).
; PLAN: r0=109(x), r1=194(y), r2=86(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 194
LDI r2, 86
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
