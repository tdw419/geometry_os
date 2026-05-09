; DESCRIPTION: Renders a black box of size 21x27 starting at (152, 21).
; PLAN: r0=152(x), r1=21(y), r2=21(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 21
LDI r2, 21
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
