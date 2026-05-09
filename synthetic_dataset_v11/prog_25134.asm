; DESCRIPTION: Renders a cyan box of size 15x43 starting at (123, 164).
; PLAN: r0=123(x), r1=164(y), r2=15(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 164
LDI r2, 15
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
