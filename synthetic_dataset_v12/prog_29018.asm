; DESCRIPTION: Renders a cyan box of size 77x100 starting at (262, 31).
; PLAN: r0=262(x), r1=31(y), r2=77(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 31
LDI r2, 77
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
