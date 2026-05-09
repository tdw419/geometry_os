; DESCRIPTION: Renders a white box of size 38x104 starting at (446, 42).
; PLAN: r0=446(x), r1=42(y), r2=38(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 42
LDI r2, 38
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
