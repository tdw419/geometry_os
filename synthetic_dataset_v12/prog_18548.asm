; DESCRIPTION: Renders a white box of size 46x86 starting at (329, 95).
; PLAN: r0=329(x), r1=95(y), r2=46(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 95
LDI r2, 46
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
