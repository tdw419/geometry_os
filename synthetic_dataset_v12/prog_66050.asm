; DESCRIPTION: Renders a cyan box of size 48x18 starting at (347, 172).
; PLAN: r0=347(x), r1=172(y), r2=48(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 172
LDI r2, 48
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
