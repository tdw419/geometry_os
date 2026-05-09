; DESCRIPTION: Renders a cyan box of size 71x71 starting at (152, 22).
; PLAN: r0=152(x), r1=22(y), r2=71(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 22
LDI r2, 71
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
