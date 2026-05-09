; DESCRIPTION: Renders a white box of size 21x32 starting at (54, 38).
; PLAN: r0=54(x), r1=38(y), r2=21(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 38
LDI r2, 21
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
