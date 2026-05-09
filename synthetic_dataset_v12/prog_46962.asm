; DESCRIPTION: Renders a cyan box of size 18x55 starting at (262, 184).
; PLAN: r0=262(x), r1=184(y), r2=18(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 184
LDI r2, 18
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
