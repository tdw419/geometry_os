; DESCRIPTION: Renders a cyan box of size 83x19 starting at (154, 227).
; PLAN: r0=154(x), r1=227(y), r2=83(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 227
LDI r2, 83
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
