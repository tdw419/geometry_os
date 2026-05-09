; DESCRIPTION: Renders a cyan box of size 34x46 starting at (414, 154).
; PLAN: r0=414(x), r1=154(y), r2=34(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 154
LDI r2, 34
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
