; DESCRIPTION: Renders a cyan box of size 27x38 starting at (69, 191).
; PLAN: r0=69(x), r1=191(y), r2=27(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 191
LDI r2, 27
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
