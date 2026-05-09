; DESCRIPTION: Renders a cyan box of size 18x49 starting at (103, 56).
; PLAN: r0=103(x), r1=56(y), r2=18(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 56
LDI r2, 18
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
