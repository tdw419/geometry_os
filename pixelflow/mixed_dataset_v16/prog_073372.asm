; DESCRIPTION: Renders a cyan box of size 45x48 starting at (299, 17).
; PLAN: r0=299(x), r1=17(y), r2=45(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 17
LDI r2, 45
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
