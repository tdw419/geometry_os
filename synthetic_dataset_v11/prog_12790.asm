; DESCRIPTION: Renders a cyan box of size 96x45 starting at (27, 10).
; PLAN: r0=27(x), r1=10(y), r2=96(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 10
LDI r2, 96
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
