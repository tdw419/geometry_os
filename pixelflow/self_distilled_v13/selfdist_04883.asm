; DESCRIPTION: Renders a cyan rectangular region spanning 71 by 16 at (72, 154).
; PLAN: r0=72(x), r1=154(y), r2=71(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 154
LDI r2, 71
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
