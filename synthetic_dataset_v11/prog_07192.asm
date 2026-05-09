; DESCRIPTION: Renders a cyan box of size 86x60 starting at (37, 23).
; PLAN: r0=37(x), r1=23(y), r2=86(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 23
LDI r2, 86
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
