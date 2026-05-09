; DESCRIPTION: Renders a cyan box of size 75x27 starting at (24, 73).
; PLAN: r0=24(x), r1=73(y), r2=75(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 73
LDI r2, 75
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
