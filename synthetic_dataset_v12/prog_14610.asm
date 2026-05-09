; DESCRIPTION: Renders a cyan box of size 14x111 starting at (184, 109).
; PLAN: r0=184(x), r1=109(y), r2=14(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 109
LDI r2, 14
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
