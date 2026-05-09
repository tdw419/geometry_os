; DESCRIPTION: Renders a cyan box of size 46x12 starting at (329, 87).
; PLAN: r0=329(x), r1=87(y), r2=46(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 87
LDI r2, 46
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
