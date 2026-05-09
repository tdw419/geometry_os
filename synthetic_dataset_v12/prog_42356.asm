; DESCRIPTION: Renders a cyan box of size 61x55 starting at (153, 64).
; PLAN: r0=153(x), r1=64(y), r2=61(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 64
LDI r2, 61
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
