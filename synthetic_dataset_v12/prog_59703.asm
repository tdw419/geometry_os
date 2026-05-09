; DESCRIPTION: Renders a cyan box of size 50x55 starting at (64, 25).
; PLAN: r0=64(x), r1=25(y), r2=50(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 25
LDI r2, 50
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
