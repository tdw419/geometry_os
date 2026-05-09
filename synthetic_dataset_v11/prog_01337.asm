; DESCRIPTION: Renders a cyan box of size 117x19 starting at (23, 128).
; PLAN: r0=23(x), r1=128(y), r2=117(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 128
LDI r2, 117
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
