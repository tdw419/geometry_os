; DESCRIPTION: Renders a cyan box of size 40x52 starting at (342, 56).
; PLAN: r0=342(x), r1=56(y), r2=40(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 56
LDI r2, 40
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
