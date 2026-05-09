; DESCRIPTION: Renders a black box of size 15x27 starting at (91, 174).
; PLAN: r0=91(x), r1=174(y), r2=15(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 174
LDI r2, 15
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
