; DESCRIPTION: Renders a white box of size 28x45 starting at (21, 142).
; PLAN: r0=21(x), r1=142(y), r2=28(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 142
LDI r2, 28
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
