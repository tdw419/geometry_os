; DESCRIPTION: Renders a cyan box of size 16x10 starting at (19, 210).
; PLAN: r0=19(x), r1=210(y), r2=16(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 210
LDI r2, 16
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
