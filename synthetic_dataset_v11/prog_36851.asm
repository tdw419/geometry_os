; DESCRIPTION: Renders a cyan box of size 88x32 starting at (6, 174).
; PLAN: r0=6(x), r1=174(y), r2=88(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 174
LDI r2, 88
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
