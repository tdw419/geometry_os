; DESCRIPTION: Renders a cyan rectangular region spanning 10 by 95 at (129, 21).
; PLAN: r0=129(x), r1=21(y), r2=10(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 21
LDI r2, 10
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
