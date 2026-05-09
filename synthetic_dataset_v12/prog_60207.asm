; DESCRIPTION: Renders a cyan box of size 77x109 starting at (418, 141).
; PLAN: r0=418(x), r1=141(y), r2=77(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 141
LDI r2, 77
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
