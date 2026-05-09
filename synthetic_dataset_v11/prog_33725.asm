; DESCRIPTION: Renders a white box of size 28x83 starting at (214, 57).
; PLAN: r0=214(x), r1=57(y), r2=28(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 57
LDI r2, 28
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
