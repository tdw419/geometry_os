; DESCRIPTION: Renders a black box of size 82x27 starting at (346, 33).
; PLAN: r0=346(x), r1=33(y), r2=82(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 33
LDI r2, 82
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
