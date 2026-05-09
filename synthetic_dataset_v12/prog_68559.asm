; DESCRIPTION: Renders a cyan box of size 27x24 starting at (259, 20).
; PLAN: r0=259(x), r1=20(y), r2=27(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 20
LDI r2, 27
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
