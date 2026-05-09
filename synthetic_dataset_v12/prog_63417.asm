; DESCRIPTION: Renders a cyan box of size 43x34 starting at (373, 218).
; PLAN: r0=373(x), r1=218(y), r2=43(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 218
LDI r2, 43
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
