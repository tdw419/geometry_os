; DESCRIPTION: Renders a cyan box of size 32x55 starting at (87, 116).
; PLAN: r0=87(x), r1=116(y), r2=32(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 116
LDI r2, 32
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
