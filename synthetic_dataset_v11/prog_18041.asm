; DESCRIPTION: Renders a cyan box of size 46x56 starting at (14, 178).
; PLAN: r0=14(x), r1=178(y), r2=46(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 178
LDI r2, 46
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
