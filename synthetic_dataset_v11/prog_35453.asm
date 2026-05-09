; DESCRIPTION: Renders a cyan box of size 85x10 starting at (62, 233).
; PLAN: r0=62(x), r1=233(y), r2=85(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 233
LDI r2, 85
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
