; DESCRIPTION: Renders a cyan box of size 58x56 starting at (10, 1).
; PLAN: r0=10(x), r1=1(y), r2=58(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 1
LDI r2, 58
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
