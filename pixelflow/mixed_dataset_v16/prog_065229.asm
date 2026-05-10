; DESCRIPTION: Renders a cyan box of size 30x48 starting at (282, 184).
; PLAN: r0=282(x), r1=184(y), r2=30(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 184
LDI r2, 30
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
