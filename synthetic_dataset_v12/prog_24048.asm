; DESCRIPTION: Renders a cyan box of size 48x15 starting at (347, 142).
; PLAN: r0=347(x), r1=142(y), r2=48(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 142
LDI r2, 48
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
