; DESCRIPTION: Renders a white box of size 83x74 starting at (237, 57).
; PLAN: r0=237(x), r1=57(y), r2=83(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 57
LDI r2, 83
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
