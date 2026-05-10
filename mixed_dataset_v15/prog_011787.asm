; DESCRIPTION: Renders a cyan box of size 120x37 starting at (214, 116).
; PLAN: r0=214(x), r1=116(y), r2=120(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 116
LDI r2, 120
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
