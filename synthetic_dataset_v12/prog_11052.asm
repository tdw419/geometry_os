; DESCRIPTION: Renders a cyan box of size 56x19 starting at (341, 154).
; PLAN: r0=341(x), r1=154(y), r2=56(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 154
LDI r2, 56
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
