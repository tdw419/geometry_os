; DESCRIPTION: Renders a cyan box of size 27x19 starting at (308, 122).
; PLAN: r0=308(x), r1=122(y), r2=27(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 122
LDI r2, 27
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
