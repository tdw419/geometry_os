; DESCRIPTION: Renders a cyan box of size 27x13 starting at (151, 100).
; PLAN: r0=151(x), r1=100(y), r2=27(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 100
LDI r2, 27
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
