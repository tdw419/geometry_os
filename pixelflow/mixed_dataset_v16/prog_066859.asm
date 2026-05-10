; DESCRIPTION: Renders a cyan box of size 33x92 starting at (201, 116).
; PLAN: r0=201(x), r1=116(y), r2=33(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 116
LDI r2, 33
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
